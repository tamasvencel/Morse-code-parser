const MorseParser = require("./MorseCodeParser");

const tests = [
  // Decoding (Morse-to-Text)
  { input: "... / --- / ...", expected: "SOS" },
  { input: ".---- / ..--- / ...--", expected: "123" },
  { input: ".- / -... / -.-. | -.. / . / ..-.", expected: "ABC DEF" },
  {
    input: ".---- / ..--- / ...-- | ....- / ..... / -....",
    expected: "123 456",
  },
  { input: "-.... / --... / ---.. / ----. / -----", expected: "67890" },

  // Encoding (Text-to-Morse)
  // { input: "SOS", expected: "... / --- / ..." },
  // { input: "123", expected: ".---- / ..--- / ...--" },
  // { input: "ABC DEF", expected: ".- / -... / -.-. | -.. / . / ..-." },
  // { input: "123 456", expected: ".---- / ..--- / ...-- | ....- / ..... / -...." },
  // { input: "67890", expected: "-.... / --... / ---.. / ----. / -----" },
];

// Run tests
tests.forEach(({ input, expected }, i) => {
  try {
    const result = MorseParser.parse(input);
    if (result === expected) {
      console.log(`Test ${i + 1} Passed: "${input}" -> "${result}"`);
    } else {
      console.error(`Test ${i + 1} Failed: "${input}"`);
      console.error(`  Expected: "${expected}"`);
      console.error(`  Received: "${result}"`);
    }
  } catch (err) {
    console.error(`Test ${i + 1} Failed with Error: "${input}"`);
    console.error(err.message);
  }
});
