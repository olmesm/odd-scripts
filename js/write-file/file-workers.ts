import path from "path";
import fs from "fs";

export const mkdirp = (outFile: string) => {
  fs.mkdirSync(path.dirname(outFile), {
    recursive: true,
  });
};

const defaultColourFunction = (s: string): string => s;

export const write = (outFile: string, data: string, { colourFunction = defaultColourFunction }) => {
  mkdirp(outFile);
  console.log(colourFunction(`Written ${outFile}`));

  return fs.writeFileSync(outFile, data, "utf8");
};
