
%{
#include <stdio.h>
#include "LOL.tab.h"
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

"="				{ return ASSIGN; }

"if"        		{ return IF; }

"else"			{ return ELSE; }

"true"					{ return TRUE; }

"false"					{ return FALSE; }

">"				{ return GREATER; }

"<"				{ return LESS; }

"&"					{ return AND; }

"|"					{return OR; }

"!"					{return NOT; }

"("					{ return LPAREN; }

")"					{ return RPAREN; }

"{"					{ return LFLOWER; }

"}"					{ return RFLOWER; }

"["					{ return LSQUARE; }

"]"					{ return RSQUARE; }

"<<"         { return PARAML; }

">>"         { return PARAMR; }

"while" 		{ yylval.string=(char *)yytext; return WHILE; }

"stack"			    { return STACK;}

"func"      		{ return FUNCTION; }

"fstart"				{ return FUNCTIONL; }

"fend"				{ return FUNCTIONR; }

"call"				{ return CALLFUNCTION; }

"scan"				{ yylval.string=(char *)yytext; return READ; }

"print"				{ yylval.string=(char *)yytext; return PRINT; }

":"					{ return END; }

"return"			{ return RETURN; }

"push"              {return PUSH;}

"pop"              {return POP;}

"peek"              {return PEEK;}

\"(\\.|[^"])*\"     {yylval.string=(char *)yytext;return STRING;}


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
