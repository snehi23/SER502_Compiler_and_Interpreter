%{
#include <stdio.h>
#include "G28.tab.h"
%}
LITERAL				[a-zA-Z]
NUMBER				[0-9]
%%
"+"					{ return PLUS; }

"-"					{ return SUB; }

"*"					{ return MULTIPLY; }

"/"					{ return DIV; }

"EQ"				{ return ASSIGN; }

"CON"        		{ return IF; }

"INSTEAD"			{ return ELSE; }

"T"					{ return TRUE; }

"F"					{ return FALSE; }

"GT"				{ return GREATER; }

"LS"				{ return LESS; }

"&"					{ return AND; }

"|"					{return OR; }

"!"					{return NOT; }

"("					{ return LPAREN; }

")"					{ return RPAREN; }

"{"					{ return LFLOWER; }

"}"					{ return RFLOWER; }

"["					{ return LSQUARE; }

"]"					{ return RSQUARE; }

"LOOP UNTIL" 		{ yylval.string=(char *)yytext; return WHILE; }

"STK"			    { return STACK;}

"FUNC"      		{ return FUNCTION; }

"LFT"				{ return FUNCTIONL; }

"RHT"				{ return FUNCTIONR; }

"CALL"				{ return CALLFUNCTION; }

"SCAN"				{ yylval.string=(char *)yytext; return READ; }

"FLASH"				{ yylval.string=(char *)yytext; return PRINT; }

":"					{ return END; }

"RETURN"			{ return RETURN; }

"PUSH"              {return PUSH;}

"POP"              {return POP;}

"PEEK"              {return PEEK;}


{NUMBER}+			{ yylval.val = atoi(yytext); return NUM; }

{LITERAL}+			{ yylval.string = (char *)strdup(yytext); return VAR; }
%%
