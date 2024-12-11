%lex
%%
\.                    return 'DOT';       /* . (dot) */
\-                    return 'DASH';      /* - (dash) */
\/                    return 'LETTERSEP'; /* / (separates letters) */
\|                    return 'WORDSEP';   /* | (separates words) */
\s+                   /* skip whitespace */
<<EOF>>               return 'EOF'
/lex

%start expressions

%%

expressions
    : word_sequence EOF
        { return $1.trim(); }
    ;

word_sequence
    : word_sequence WORDSEP word
        { $$ = $1 + ' ' + $3; }
    | word
        { $$ = $1; }
    ;

word
    : word LETTERSEP letter
        { $$ = $1 + $3; }
    | letter
        { $$ = $1; }
    ;

letter
    : symbol_sequence
        { $$ = translate($1); }
    ;

symbol_sequence
    : symbol_sequence DOT
        { $$ = $1 + '.'; }
    | symbol_sequence DASH
        { $$ = $1 + '-'; }
    | DOT
        { $$ = '.'; }
    | DASH
        { $$ = '-'; }
    ;

%%

function translate(morse) {
    const morseToChar = {
        ".-": "A", "-...": "B", "-.-.": "C", "-..": "D", ".": "E",
        "..-.": "F", "--.": "G", "....": "H", "..": "I", ".---": "J",
        "-.-": "K", ".-..": "L", "--": "M", "-.": "N", "---": "O",
        ".--.": "P", "--.-": "Q", ".-.": "R", "...": "S", "-": "T",
        "..-": "U", "...-": "V", ".--": "W", "-..-": "X", "-.--": "Y",
        "--..": "Z", "-----": "0", ".----": "1", "..---": "2",
        "...--": "3", "....-": "4", ".....": "5", "-....": "6",
        "--...": "7", "---..": "8", "----.": "9"
    };
    return morseToChar[morse] || '';
}