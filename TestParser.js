const parser = require("./MorseCodeParser");

const input = ".... / . / .-.. / .-.. / --- | .-- / --- / .-. / .-.. / -..";

try {
  const output = parser.parse(input);

  console.log(`Decoded Morse code: ${output}`);
} catch (error) {
  console.error(`Parsing error: ${error}`);
}
