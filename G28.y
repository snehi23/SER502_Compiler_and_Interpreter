%{
#include <stdio.h>
#include <string.h>

char intermediate_code[200][25]; /* 2D character array to store generated intermediate code */
char to_string[16];			 	 /* NUM to string value */
int store_to_stack[5];			 /* Location storage before execution of condition */
int code_line_number = 0;		 /* Index for intermediate code line number */
int current_line_number; 		 /* Line index stored in stack */
int stored_location;			 /* Location value stored in stack */
int lineno= 0;
int var1 = 0;

int i = 0, x = 0;

void push(int code_line_number) {

	store_to_stack[i++] = code_line_number;

}

int pop() {

	if(i >= 0) {

		x = store_to_stack[--i];

		return x;
	}

	return 0;

}

%}


%union {
	int val;
	char *string;
}

/* Tokens from FLEX*/



%token LFLOWER RFLOWER LSQUARE RSQUARE PARAML PARAMR FUNCTIONL FUNCTIONR LPAREN RPAREN STACK PUSH POP PEEK /* brackets */


%token ASSIGN GREATER LESS AND OR NOT											/* boolean operators */

%token TRUE FALSE													/* boolean keywords */

%token PLUS SUB MULTIPLY DIV  												/* arithmatic operators */

%token IF ELSE WHILE FUNCTION												/* statement keywords */

%token READ PRINT CALLFUNCTION												/* statement operators */

%token RETURN 																/* return statement operators */

%token END 																	/* end of statement */



%token <val> 	NUM       													/* NUM token contains a number */

%token <string> VAR   														/* VAR token contains a variable */

%token <string> STRING

%type <val> 	expression

%type <string> 	statement



/* Associativity of operators in order of increasing precedence */

%left 	GREATER LESS

%right 	ASSIGN

%left 	PLUS SUB

%left 	MULTIPLY DIV

%%

input : 	/* empty */
			| input line
;

line : 	END	| expression END 						{ lineno++; }
;

expression :    statement
			  | expression PLUS expression	 		{
														strcpy(intermediate_code[code_line_number++],"add\n");
													}

			  | expression SUB expression			{
														strcpy(intermediate_code[code_line_number++],"sub\n");
													}

			  | expression MULTIPLY expression		{
														strcpy(intermediate_code[code_line_number++],"mul\n");
													}

			  | expression DIV expression			{
														strcpy(intermediate_code[code_line_number++],"div\n");
													}
				| expression AND expression	 		{
														strcpy(intermediate_code[code_line_number++],"and\n");
													}

				| expression OR expression	 		{
														strcpy(intermediate_code[code_line_number++],"or\n");
													}
				| NOT expression  {
														strcpy(intermediate_code[code_line_number++],"not\n");
													}

			  | VAR							{
														strcpy(intermediate_code[code_line_number],"get ");
														strcat(intermediate_code[code_line_number],$1);
														strcat(intermediate_code[code_line_number++],"\n");
													}

			  | NUM 			    				{
														strcpy(intermediate_code[code_line_number],"get ");
														sprintf(to_string,"%d",$1);
														strcat(intermediate_code[code_line_number],to_string);
														strcat(intermediate_code[code_line_number++],"\n");
													}

			  | TRUE								{
														strcpy(intermediate_code[code_line_number],"get ");
														strcat(intermediate_code[code_line_number],"true");
														strcat(intermediate_code[code_line_number++],"\n");
													}

	  		  | FALSE 								{
		 												strcpy(intermediate_code[code_line_number],"get ");
														strcat(intermediate_code[code_line_number],"false");
														strcat(intermediate_code[code_line_number++],"\n");
	  												}
			


;

statement :
										  
			  | VAR ASSIGN STRING                    {
			  											strcpy(intermediate_code[code_line_number],"str ");
														strcat(intermediate_code[code_line_number],$3);
														strcat(intermediate_code[code_line_number++],"\n");
											strcat(intermediate_code[code_line_number],"put ");
											strcat(intermediate_code[code_line_number],$1);
											strcat(intermediate_code[code_line_number++],"\n");
											
											
											}
				|PRINT STRING              {strcpy(intermediate_code[code_line_number],"str ");
												strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
											strcat(intermediate_code[code_line_number++],"dsp\n");
											
										}
				| IF expression LSQUARE 	{
												strcpy(intermediate_code[code_line_number++],"bne ");
											}

				| RSQUARE 		{
											current_line_number=pop();
											stored_location=pop();
											stored_location=code_line_number;
											stored_location++;
											sprintf(to_string,"%d",stored_location);
											if (var1 == 0){
												strcat(intermediate_code[current_line_number],to_string);
												strcat(intermediate_code[current_line_number],"\n");}
											else {
												stored_location=code_line_number++;
												sprintf(to_string,"%d",stored_location);
												strcat(intermediate_code[var1],to_string);
											    strcat(intermediate_code[var1],"\n"); 
												var1=0;
											}
										}
				| ELSE LSQUARE {    		
								        strcpy(intermediate_code[code_line_number++],"get 1\n");
										var1 = code_line_number;
										strcpy(intermediate_code[code_line_number++],"beq ");

							}
											
				| STACK VAR  		{
											strcpy(intermediate_code[code_line_number++],"stk ");
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
								
									}
				|  PUSH VAR NUM 		{
											strcat(intermediate_code[code_line_number++],"get ");
											sprintf(to_string,"%d",$3);	
											strcat(intermediate_code[code_line_number],to_string);
											strcat(intermediate_code[code_line_number++],"\n");
											strcpy(intermediate_code[code_line_number++],"psh ");
											strcat(intermediate_code[code_line_number],$2);														
											strcat(intermediate_code[code_line_number++],"\n");
										}
										
			   |  POP  VAR	{
										strcpy(intermediate_code[code_line_number++],"pop ");
											
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
										}
										
			   |  PEEK  VAR		{
											strcpy(intermediate_code[code_line_number++],"pek ");
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
										}

				| FUNCTION VAR FUNCTIONL
										{
											strcpy(intermediate_code[code_line_number],"fun ");
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
										}
				| FUNCTION VAR PARAML VAR PARAMR FUNCTIONL
										{
											strcpy(intermediate_code[code_line_number],"fun ");
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
											strcpy(intermediate_code[code_line_number],"pta ");
											strcat(intermediate_code[code_line_number],$4);
											strcat(intermediate_code[code_line_number++],"\n");
										}																

				| CALLFUNCTION VAR 
										{
											strcpy(intermediate_code[code_line_number],"get ");
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
											strcpy(intermediate_code[code_line_number++],"run\n");
										}
				| CALLFUNCTION VAR PARAML VAR PARAMR  
										{
											strcpy(intermediate_code[code_line_number],"gta ");
											strcat(intermediate_code[code_line_number],$4);
											strcat(intermediate_code[code_line_number++],"\n");
											strcpy(intermediate_code[code_line_number],"get ");
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
											strcpy(intermediate_code[code_line_number++],"run\n");
										}
				| CALLFUNCTION VAR PARAML NUM PARAMR  
										{
											strcpy(intermediate_code[code_line_number],"gta ");
											sprintf(to_string,"%d",$4);
											strcat(intermediate_code[code_line_number],to_string);
											strcpy(intermediate_code[code_line_number],"get ");
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
											strcat(intermediate_code[code_line_number++],"\n");
											strcpy(intermediate_code[code_line_number++],"run\n");
										}												

				| FUNCTIONR		    	{
											strcpy(intermediate_code[code_line_number++],"fnd\n");
										}

				| WHILE expression LFLOWER 	{
												strcpy(intermediate_code[code_line_number++],"bne ");
											}

				| RETURN VAR			{

											strcpy(intermediate_code[code_line_number],"jbk ");
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
										}

				| RFLOWER				{
											current_line_number=pop();
											stored_location=pop();

											strcpy(intermediate_code[code_line_number++],"get 1\n");
											strcpy(intermediate_code[code_line_number],"beq ");
											sprintf(to_string,"%d",stored_location);
											strcat(intermediate_code[code_line_number],to_string);
											strcat(intermediate_code[code_line_number],"\n");
											stored_location=code_line_number++;
											sprintf(to_string,"%d",stored_location);
											strcat(intermediate_code[current_line_number],to_string);
										    strcat(intermediate_code[current_line_number],"\n");
										}


				| LPAREN condition RPAREN	{
												code_line_number=code_line_number-3;
												push(code_line_number);
												code_line_number=code_line_number+3;
												push(code_line_number);
											}

				| READ VAR				{
											strcpy(intermediate_code[code_line_number++],"fth\n");
											strcpy(intermediate_code[code_line_number],"put ");
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
										}

				| PRINT expression		 		{
											strcpy(intermediate_code[code_line_number++],"dsp\n");
										}

				| VAR ASSIGN expression		{
												strcpy(intermediate_code[code_line_number],"put ");
												strcat(intermediate_code[code_line_number],$1);
												strcat(intermediate_code[code_line_number++],"\n");
											}


;


condition :			| expression GREATER expression	{
														strcpy(intermediate_code[code_line_number++],"grt\n");
													}
					| expression LESS expression	{
														strcpy(intermediate_code[code_line_number++],"lst\n");
													}
;

%%

#include<stdio.h>
#include<string.h>

extern FILE *yyin;
extern char *yytext;
extern int yylineno;



int main (int argc,char **argv)
{

	char output_file_name[60];
   	FILE *fp;
   	++argv, --argc;
   	int i = 0;

   	if (argc > 0)	{

		strcpy(output_file_name, argv[0]);

     	yyin = fopen(argv[0], "r");

   	}
   	else 	{

     	yyin = stdin;
   	}

	yyparse();															/* parsing starts here */

   	strcat(output_file_name, ".asm");									/* a file with extension .g28.int for intermediate code */

	fp = fopen(output_file_name, "w");

	strcpy(intermediate_code[code_line_number++], "end\n");				/* appending end of file to intermediate code generated */

   	while(i < code_line_number)	{

      	fprintf(fp,"%s", intermediate_code[i++]);

   	}

	fclose(fp);

	return 0;
}

int yyerror (char *s) 	{ 
											/* error case handling on parsing */

 printf ("ERROR: %s -----%s----- at line number :  %d\n",s,yytext,yylineno);
 
 return 0;
}