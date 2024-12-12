%lex
%%
[A-Za-z]               return 'LETTER';     /* Matches a single letter */
[0-9]                  return 'NUMBER';     /* Matches a single number */
\s+                    return 'SPACE';      /* Matches whitespace */
<<EOF>>                return 'EOF';        /* End of input */
/lex

%start expressions

%{
const CHAR_TO_MORSE = {
    A: ".-",     B: "-...",   C: "-.-.",   D: "-..",    E: ".",
    F: "..-.",   G: "--.",    H: "....",   I: "..",     J: ".---",
    K: "-.-",    L: ".-..",   M: "--",     N: "-.",     O: "---",
    P: ".--.",   Q: "--.-",   R: ".-.",    S: "...",    T: "-",
    U: "..-",    V: "...-",   W: ".--",    X: "-..-",   Y: "-.--",
    Z: "--..",   0: "-----",  1: ".----",  2: "..---",  3: "...--",
    4: "....-",  5: ".....",  6: "-....",  7: "--...",  8: "---..",
    9: "----."
};

function toMorse(char) {
    return CHAR_TO_MORSE[char.toUpperCase()] || '';
}
%}

%%

expressions
    : text_sequence EOF
        { return $1.trim(); }
    ;

text_sequence
    : text_sequence SPACE text
        { $$ = $1 + " | " + $3; }
    | text
        { $$ = $1; }
    ;

text
    : text morse_letter
        { $$ = $1 + " / " + $2; }
    | morse_letter
        { $$ = $1; }
    ;

morse_letter
    : LETTER
        { $$ = toMorse(yytext); }
    | NUMBER
        { $$ = toMorse(yytext); }
    ;