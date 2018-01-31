%{
#include <stdio.h>
#include <string.h>

#define YYSTYPE char *

int yydebug=0;

void yyerror(const char *str)
{
    fprintf(stderr, "error: %s\n", str);
}

int yywrap()
{
    return 1;
}

main()
{
    yyparse();
}

%}

%token ZONETOK FILETOK WORD FILENAME QUOTE OBRACE EBRACE SEMICOLON

%%

commands:
    |
    commands command SEMICOLON
    ;

command:
    zone_set
    ;

zone_set:
    ZONETOK quotedname zonecontent
    {
        printf("Complete zone for '%s' found\n", $2);
    }
    ;

zonecontent:
    OBRACE zonestatements EBRACE
    ;

quotedname:
    QUOTE FILENAME QUOTE
    {
        $$=$2;
    }
    ;

zonestatements:
    |
    zonestatements zonestatement SEMICOLON
    ;

zonestatement:
    statements
    |
    FILETOK quotedname
    {
        printf("A zonefile name '%s' was encountered\n", $2);
    }
    ;

block:
    OBRACE zonestatements EBRACE SEMICOLON
    ;

statements:
    | statements statement
    ;

statement: WORD | block | quotedname
