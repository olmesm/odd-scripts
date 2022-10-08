const types = {
  undefined: "undefined",
  object: "object",
  array: "array",
  number: "number",
  null: "null",
  boolean: "boolean",
  function: "function",
  date: "date",
  symbol: "symbol",
  string: "string",
} as const;

export function getRealObjectType(obj: unknown): string {
  return Object.prototype.toString
    .call(obj)
    .match(/\[\w+ (\w+)\]/)[1]
    .toLowerCase();
}
