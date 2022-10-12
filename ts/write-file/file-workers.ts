import path from "path";
import fs from "fs";

export const mkdirp = (outFile: string): void => {
  fs.mkdirSync(path.dirname(outFile), {
    recursive: true,
  });
};

const defaultColourFunction = (s: string): string => s;

const defaultOptions = { colourFunction: defaultColourFunction }

export const write = (outFile: string, data: string, options?: Partial<typeof defaultOptions>): void => {
  const _options = Object.assign(defaultOptions, options)

  mkdirp(outFile);
  console.log(_options.colourFunction(`[info] Wrote ${outFile}`));

  return fs.writeFileSync(outFile, data, "utf8");
};
