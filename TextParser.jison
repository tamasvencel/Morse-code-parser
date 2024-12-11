%lex
%%
[a-zA-Z0-9]           return 'CHAR';       /* Letters and digits */
\s+                   return 'SPACE';      /* Space between words */
<<EOF>>               return 'EOF';        /* End of input */
/lex

%start expressions

%%

expressions
    : text EOF
        { return $1.trim(); }
    ;

text
    : text SPACE word
        { $$ = $1 + " | " + $3; } // Use "|" to separate words
    | word
        { $$ = $1; }
    ;

word
    : word CHAR
        { $$ = $1 + " / " + translate($2); } // Use "/" to separate letters
    | CHAR
        { $$ = translate($1); }
    ;

%%

function translate(char) {
    const charToMorse = {
        A: ".-", B: "-...", C: "-.-.", D: "-..", E: ".",
        F: "..-.", G: "--.", H: "....", I: "..", J: ".---",
        K: "-.-", L: ".-..", M: "--", N: "-.", O: "---",
        P: ".--.", Q: "--.-", R: ".-.", S: "...", T: "-",
        U: "..-", V: "...-", W: ".--", X: "-..-", Y: "-.--",
        Z: "--..", 0: "-----", 1: ".----", 2: "..---",
        3: "...--", 4: "....-", 5: ".....", 6: "-....",
        7: "--...", 8: "---..", 9: "----.",
    };

    char = char.toUpperCase(); // Convert to uppercase for matching
    return charToMorse[char] || ''; // Return Morse code or empty string
}