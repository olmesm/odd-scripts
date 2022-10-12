import fs from 'node:fs'
import path from 'node:path'
import lodash from 'lodash'
import { write } from '../write-file/file-workers'

const LIST_JOINER = '\n    * '
const OVERWRITE_FLAGS = ['-o', '--overwrite']
const SPECIAL_CHARS = /[-[\]{}()*+?.,\\^$|#\s]/g

type TemplateType = keyof typeof templateList

const template = (type: string) => fs.readFileSync(pathMaker('scripts', 'strap', '_templates', `${type}.ts`), 'utf-8')
const pathMaker = (...args: string[]): string => args.join(path.sep)

const templateList = {
  component: {
    templateLocation: template('component'),
    outDir: pathMaker('src', 'components')
  }
} as const


const transformer = (type: TemplateType, name: string) => ({
  $$TYPE: `${lodash.lowerCase(type)}`,
  $$FILE_NAME_SNAKE: `${lodash.kebabCase(name)}`,
  $$FILE_NAME_PASCAL: `${lodash.upperFirst(lodash.camelCase(name))}`
})

const error = (message: string) => {
  console.error(`[error] ${message}`)

  return process.exit(1)
}

const main = () => {
  console.log('\n') // clear line for readability
  const [_, __, _templateType, componentName, overwriteFlag] = process.argv
  const templateType = _templateType as TemplateType
  const templateConfig = templateList[templateType]

  if (!templateConfig) {
    error(`Template type not found. Please use one of the following:${LIST_JOINER}${Object.keys(templateList).join(LIST_JOINER)}`)
  }

  if (!componentName) {
    error(`Please enter a name for your ${templateType}.`)
  }

  if (overwriteFlag && !OVERWRITE_FLAGS.includes(overwriteFlag)) {
    error(`Invalid flag. Accepts:${LIST_JOINER}${OVERWRITE_FLAGS.join(LIST_JOINER)}`)
  }

  const names = transformer(templateType, componentName)
  const outFile = pathMaker(templateConfig.outDir, `${names.$$FILE_NAME_SNAKE}.ts`)

  if (fs.existsSync(outFile) && !overwriteFlag) {
    error(`File \`${outFile}\` exists. Please include an overwrite flag (${OVERWRITE_FLAGS.map(f => `\`${f}\``).join(' or ')}) if required.\n\n Did you forget to pass additional script arguments with a \`--\`?\n https://docs.npmjs.com/cli/v8/commands/npm-run-script#description`)
  }

  const instantiatedTemplate = Object.entries(names).reduce((a, [k, v]) => {
    const reg = new RegExp(k.replace(SPECIAL_CHARS, '\\$&'), 'g')

    return a.replace(reg, v)
  }, templateConfig.templateLocation)

  return write(outFile, instantiatedTemplate)
}

main()
