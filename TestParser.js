const MorseParser = require("./MorseCodeParser.js");

const input = ".... / . / .-.. / .-.. / --- | .-- / --- / .-. / .-.. / -..";
const parser = MorseParser.parser;

try {
  const result = parser.parse(input);
  console.log("Decoded Text:", result);
} catch (err) {
  console.error("Error:", err.message);
}
