import fs from "node:fs";
import path from "node:path";

const pathConstructor = (...args) => args.join(path.sep);

const directoryStructure = (dir) =>
  fs.readdirSync(dir).flatMap((curr) => {
    const fullFilePath = pathConstructor(dir, curr);

    if (fs.statSync(fullFilePath).isDirectory()) {
      return directoryStructure(fullFilePath).flatMap((f) =>
        pathConstructor(fullFilePath, f)
      );
    }

    return fullFilePath;
  });

const main = () => {
  const dir = ["ts", "shell"].flatMap(directoryStructure);
  console.log(dir);
};

main();
