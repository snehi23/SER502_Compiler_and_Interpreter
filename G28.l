
%{
#include <stdio.h>
#include "G28.tab.h"
static void forget_to_close_comment_error(void);
static void skip_single_line_comment(void);
static void skip_multiple_line_comment(void);

%}

%option yylineno
%option noyywrap

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

"<"         { return PARAML; }

">"         { return PARAMR; }

"LOOP UNTIL" 		{ yylval.string=(char *)yytext; return WHILE; }

"STACK"			    { return STACK;}

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


"//".*                                    { /* DO NOTHING */ }
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]       { /* DO NOTHING */ }
                    
 [/][*]                                    {forget_to_close_comment_error(); }
                    

" "               { /* empty */ }
[\n|\r\n\t]       { /* empty */ }




{NUMBER}+			{ yylval.val = atoi(yytext); return NUM; }

{LITERAL}+			{ yylval.string = (char *)strdup(yytext); return VAR; }
%%


static void forget_to_close_comment_error(void){
   fprintf(stderr, "Tokenizing error: '%c'\n", *yytext); 
 fprintf(stderr, "Error unclosed comment, expect */\n");
        exit(-1);
}

static void skip_single_line_comment(void)
{
  int c;
  /* Read until we find \n or EOF */
  while((c = input()) != '\n' && c != EOF)
    ;

  /* Maybe you want to place back EOF? */
  if(c == EOF)
    unput(c);
}

static void skip_multiple_line_comment(void)
{
  int c;

  for(;;)
  {
    switch(input())
    {
      /* We expect ending the comment first before EOF */
      case EOF:
        fprintf(stderr, "Error unclosed comment, expect */\n");
        exit(-1);
        goto done;
      break;
      /* Is it the end of comment? */
      case '*':
        if((c = input()) == '/')
          goto done;
        unput(c);
        break;
      default:
        /* skip this character */
        break;
    }
  }

done:
  /* exit entry */ ;
}
