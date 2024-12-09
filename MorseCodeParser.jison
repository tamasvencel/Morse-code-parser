%lex
%%
\s+                    /* Ignore whitespaces */
\.                     return 'DOT';       /* . (dot) */
\-                     return 'DASH';      /* - (dash) */
\/                    return 'LETTERSEP'; /* / (separates letters) */
\|                    return 'WORDSEP';   /* | (separates words) */
<<EOF>>                return 'EOF';
/lex

%start morse_code

%%

morse_code
  : letters WORDSEP morse_code
    { return $1 + ' ' + $3; }
  | letters EOF
    { return $1; }
  ;

letters
  : letter LETTERSEP letters
    { return $1 + $3; }
  | letter
    { return $1; }
  ;

letter
  : DOT DASH           { return 'A'; }
  | DASH DOT DOT DOT   { return 'B'; }
  | DASH DOT DASH DOT  { return 'C'; }
  | DASH DOT DOT       { return 'D'; }
  | DOT                { return 'E'; }
  | DOT DOT DASH DOT   { return 'F'; }
  | DASH DASH DOT      { return 'G'; }
  | DOT DOT DOT DOT    { return 'H'; }
  | DOT DOT            { return 'I'; }
  | DOT DASH DASH DASH { return 'J'; }
  | DASH DOT DASH      { return 'K'; }
  | DOT DASH DOT DOT   { return 'L'; }
  | DASH DASH          { return 'M'; }
  | DASH DOT           { return 'N'; }
  | DASH DASH DASH     { return 'O'; }
  | DOT DASH DASH DOT  { return 'P'; }
  | DASH DASH DOT DASH { return 'Q'; }
  | DOT DASH DOT       { return 'R'; }
  | DOT DOT DOT        { return 'S'; }
  | DASH               { return 'T'; }
  | DOT DOT DASH       { return 'U'; }
  | DOT DOT DOT DASH   { return 'V'; }
  | DOT DASH DASH      { return 'W'; }
  | DASH DOT DOT DASH  { return 'X'; }
  | DASH DOT DASH DASH { return 'Y'; }
  | DASH DASH DOT DOT  { return 'Z'; }
  ;