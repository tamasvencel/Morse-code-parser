%lex
%%
\.                    return 'DOT';        /* . (dot) */
\-                    return 'DASH';       /* - (dash) */
\/                    return 'LETTERSEP';  /* / separates letters */
\|                    return 'WORDSEP';    /* | separates words */
\s+                   /* Skip whitespace */
<<EOF>>               return 'EOF';        /* End of input */
/lex

%start expressions

%%

expressions
    : word_sequence EOF
        { return $1.trim(); }
    ;

word_sequence
    : word_sequence WORDSEP word
        { $$ = $1 + " " + $3; }
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
    : DOT DASH           { $$ = 'A'; }
    | DASH DOT DOT DOT   { $$ = 'B'; }
    | DASH DOT DASH DOT  { $$ = 'C'; }
    | DASH DOT DOT       { $$ = 'D'; }
    | DOT                { $$ = 'E'; }
    | DOT DOT DASH DOT   { $$ = 'F'; }
    | DASH DASH DOT      { $$ = 'G'; }
    | DOT DOT DOT DOT    { $$ = 'H'; }
    | DOT DOT            { $$ = 'I'; }
    | DOT DASH DASH DASH { $$ = 'J'; }
    | DASH DOT DASH      { $$ = 'K'; }
    | DOT DASH DOT DOT   { $$ = 'L'; }
    | DASH DASH          { $$ = 'M'; }
    | DASH DOT           { $$ = 'N'; }
    | DASH DASH DASH     { $$ = 'O'; }
    | DOT DASH DASH DOT  { $$ = 'P'; }
    | DASH DASH DOT DASH { $$ = 'Q'; }
    | DOT DASH DOT       { $$ = 'R'; }
    | DOT DOT DOT        { $$ = 'S'; }
    | DASH               { $$ = 'T'; }
    | DOT DOT DASH       { $$ = 'U'; }
    | DOT DOT DOT DASH   { $$ = 'V'; }
    | DOT DASH DASH      { $$ = 'W'; }
    | DASH DOT DOT DASH  { $$ = 'X'; }
    | DASH DOT DASH DASH { $$ = 'Y'; }
    | DASH DASH DOT DOT  { $$ = 'Z'; }
    | DASH DASH DASH DASH DASH { $$ = '0'; }
    | DOT DASH DASH DASH DASH  { $$ = '1'; }
    | DOT DOT DASH DASH DASH   { $$ = '2'; }
    | DOT DOT DOT DASH DASH    { $$ = '3'; }
    | DOT DOT DOT DOT DASH     { $$ = '4'; }
    | DOT DOT DOT DOT DOT      { $$ = '5'; }
    | DASH DOT DOT DOT DOT     { $$ = '6'; }
    | DASH DASH DOT DOT DOT    { $$ = '7'; }
    | DASH DASH DASH DOT DOT   { $$ = '8'; }
    | DASH DASH DASH DASH DOT  { $$ = '9'; }
    ;