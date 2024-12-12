const MorseCodeParser = require("./MorseCodeParser"); // Morse-to-text parser
const TextToMorseParser = require("./TextToMorse"); // Text-to-Morse parser

const testCases = [
  "A", // Single letter
  "HELLO", // Simple word
  "12345", // Simple numbers
  "HELLO WORLD", // Multiple words
  "MORSE CODE", // Uppercase with space
  "PROGRAMMING", // Long word
  "SOS", // Classic example
  "TEST CASE", // Two words
  "ABC123", // Mixed letters and numbers
  "9876543210", // All numbers
  "AAAAA", // Repeated letters
  "00000", // Repeated numbers
  "HELLO123", // Mixed letters and numbers
  "CODE PARSER", // Phrase with two words
  "THIS IS A TEST", // Sentence with multiple words
  "LONG SENTENCE HERE", // Longer sentence
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ", // Full alphabet
  "1234567890", // All numbers in sequence
  "EDGE CASE", // Edge case phrase
  "PARSE CHECK", // Another edge phrase
];

function runTests() {
  testCases.forEach((text, i) => {
    try {
      // Step 1: Encode text to Morse code
      const morseCode = TextToMorseParser.parse(text);

      // Step 2: Decode Morse code back to text
      const decodedText = MorseCodeParser.parse(morseCode);

      // Step 3: Verify round-trip integrity
      if (decodedText === text) {
        console.log(
          `Test ${
            i + 1
          } Passed: "${text}" -> "${morseCode}" -> "${decodedText}"`
        );
      } else {
        console.error(`Test ${i + 1} Failed: "${text}"`);
        console.error(`  Intermediate Morse: "${morseCode}"`);
        console.error(`  Decoded Text: "${decodedText}"`);
      }
    } catch (err) {
      console.error(`Test ${i + 1} Failed with Error: "${text}"`);
      console.error(err.message);
    }
  });
}

// Run the tests
runTests();
