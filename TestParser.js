const TextParser = require("./TextParser");
const MorseCodeParser = require("./MorseCodeParser");
const readline = require("readline");

// Create a readline interface
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

// Prompt user for text input
rl.question("Enter text to encode into Morse code: ", (inputText) => {
  try {
    // Encode text to Morse code
    const morseCode = TextParser.parse(inputText);
    console.log(`Encoded Morse Code: ${morseCode}`);

    // Decode Morse code back to text
    const decodedText = MorseCodeParser.parse(morseCode);
    console.log(`Decoded Text: ${decodedText}`);
  } catch (err) {
    console.error("Error:", err.message);
  } finally {
    rl.close();
  }
});
