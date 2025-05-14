%{
#include "sw_bison.tab.h"
#include <string.h>
extern int yylineno;
%}

%option noyywrap
%option yylineno

%%

"lightspeed"             { return LIGHTSPEED; }             // Program start keyword
"landing"                { return LANDING; }                // Program end keyword
"mission"                { return MISSION; }                // Function definition keyword
"transmit"               { return TRANSMIT; }               // Return statement keyword
"through_holonet"        { return THROUGH_HOLONET; }        // Print statement keyword
"sense_force"            { return SENSE_FORCE; }            // If statement keyword
"disturbance"            { return DISTURBANCE; }            // Else statement keyword
"jedi_master"            { return JEDI_MASTER; }            // Variable declaration keyword
"int"                    { return INT_TYPE; }               // Integer type keyword
"float"                  { return FLOAT_TYPE; }             // Float type keyword
"void"                   { return VOID_TYPE; }              // Void type keyword
"while_the_force_sense_that" { return WHILE_LOOP; }          // While loop keyword

"=="                     { yylval.str = strdup(yytext); return EQ; }       // Equality operator
"!="                     { yylval.str = strdup(yytext); return NE; }       // Inequality operator
"<="                     { yylval.str = strdup(yytext); return LE; }       // Less than or equal to operator
">="                     { yylval.str = strdup(yytext); return GE; }       // Greater than or equal to operator
"<"                      { yylval.str = strdup(yytext); return LT; }       // Less than operator
">"                      { yylval.str = strdup(yytext); return GT; }       // Greater than operator

[0-9]+\.[0-9]+          { yylval.str = strdup(yytext); return FLOATING; }   // Floating-point number
[0-9]+                   { yylval.str = strdup(yytext); return INTEGER; }    // Integer number

@_([a-zA-Z][_a-zA-Z0-9]*) { yylval.str = strdup(yytext + 2); return IDENTIFIER; } // Identifier (starts with @_)

\"[^"]*\"               { yylval.str = strdup(yytext + 1); yylval.str[strlen(yylval.str) - 1] = '\0'; return STRING; } // String literal

"/Roger[^/]*Roger/"      { /* Ignore comments */ }  // Match comment pattern "/Roger ... Roger/"

"="                      { return '='; }                   // Assignment operator
"+"                      { return '+'; }                   // Addition operator
"-"                      { return '-'; }                   // Subtraction operator
"*"                      { return '*'; }                   // Multiplication operator
"/"                      { return '/'; }                   // Division operator
"("                      { return '('; }                   // Left parenthesis
")"                      { return ')'; }                   // Right parenthesis
"{"                      { return '{'; }                   // Left curly brace
"}"                      { return '}'; }                   // Right curly brace
";"                      { return ';'; }                   // Semicolon

[ \t\r\n]+             { /* skip whitespace */ }          // Ignore whitespace

.                      { fprintf(stderr, "Unknown keyword or invalid identifier at line %d: %s\n", yylineno, yytext); }

%%
