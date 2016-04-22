%{
#include <stdio.h>
#include <string.h>

char intermediate_code[200][25]; /* 2D character array to store generated intermediate code */
char to_string[16];			 	 /* NUM to string value */
int store_to_stack[5];			 /* Location storage before execution of condition */
int code_line_number = 0;		 /* Index for intermediate code line number */
int current_line_number; 		 /* Line index stored in stack */
int stored_location;			 /* Location value stored in stack */

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


%token LFLOWER RFLOWER LSQUARE RSQUARE FUNCTIONL FUNCTIONR LPAREN RPAREN STACK PUSH POP PEEK /* brackets */

%token ASSIGN GREATER LESS AND OR	NOT											/* boolean operators */

%token TRUE FALSE													/* boolean keywords */

%token PLUS SUB MULTIPLY DIV  												/* arithmatic operators */

%token IF ELSE WHILE FUNCTION												/* statement keywords */

%token READ PRINT CALLFUNCTION												/* statement operators */

%token RETURN 																/* return statement operators */

%token END 																	/* end of statement */



%token <val> 	NUM       													/* NUM token contains a number */

%token <string> VAR   														/* VAR token contains a variable */



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

line : 	END	| expression END 						{ printf("\n"); }
;


expression :    statement
			  | expression PLUS expression	 		{
														strcpy(intermediate_code[code_line_number++],"add\n");
													}

			  | expression SUB expression			{
														strcpy(intermediate_code[code_line_number++],"sub\n");
													}

			  | expression MULTIPLY expression		{
														strcpy(intermediate_code[code_line_number++],"pro\n");
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
														strcpy(intermediate_code[code_line_number],"lod ");
														strcat(intermediate_code[code_line_number],$1);
														strcat(intermediate_code[code_line_number++],"\n");
													}

			  | NUM 			    				{
														strcpy(intermediate_code[code_line_number],"lod ");
														sprintf(to_string,"%d",$1);
														strcat(intermediate_code[code_line_number],to_string);
														strcat(intermediate_code[code_line_number++],"\n");
													}

			  | TRUE								{
														strcpy(intermediate_code[code_line_number],"lod ");
														strcat(intermediate_code[code_line_number],"true");
														strcat(intermediate_code[code_line_number++],"\n");
													}

	  		  | FALSE 								{
		 												strcpy(intermediate_code[code_line_number],"lod ");
														strcat(intermediate_code[code_line_number],"false");
														strcat(intermediate_code[code_line_number++],"\n");
	  												}
			  							
			 
;

statement :
				| IF expression LSQUARE 	{
												strcpy(intermediate_code[code_line_number++],"fjp ");
											}

				| RSQUARE				{
											current_line_number=pop();
											stored_location=pop();
											stored_location=code_line_number;
											sprintf(to_string,"%d",stored_location);
											strcat(intermediate_code[current_line_number],to_string);
											strcat(intermediate_code[current_line_number],"\n");
										}
			
				| STACK VAR  		{
											strcpy(intermediate_code[code_line_number++],"stack ");
											
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
										}
				| VAR PUSH expression 		{
										strcpy(intermediate_code[code_line_number++],"push ");
											
											strcat(intermediate_code[code_line_number],$1);
											strcat(intermediate_code[code_line_number++],"\n");
										}
										
			   | VAR POP  		{
										strcpy(intermediate_code[code_line_number++],"pop ");
											
											strcat(intermediate_code[code_line_number],$1);
											strcat(intermediate_code[code_line_number++],"\n");
										}
										
			   | VAR PEEK  		{
										strcpy(intermediate_code[code_line_number++],"peek ");
											
											strcat(intermediate_code[code_line_number],$1);
											strcat(intermediate_code[code_line_number++],"\n");
										}

				| FUNCTION VAR FUNCTIONL
										{
											strcpy(intermediate_code[code_line_number],"fun ");
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
											strcat(intermediate_code[code_line_number++],"\n");
										}
				| CALLFUNCTION VAR
										{
											strcpy(intermediate_code[code_line_number],"lod ");
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
											strcpy(intermediate_code[code_line_number++],"cal\n");
										}

				| FUNCTIONR		    	{
											strcpy(intermediate_code[code_line_number++],"eof\n");
										}

				| WHILE expression LFLOWER 	{
												strcpy(intermediate_code[code_line_number++],"fjp ");
											}

				| RETURN VAR			{

											strcpy(intermediate_code[code_line_number],"rtn ");
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
										}

				| RFLOWER				{
											current_line_number=pop();
											stored_location=pop();

											strcpy(intermediate_code[code_line_number++],"lod 1\n");
											strcpy(intermediate_code[code_line_number],"tjp ");
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
											strcpy(intermediate_code[code_line_number++],"rdv\n");
											strcpy(intermediate_code[code_line_number],"sto ");
											strcat(intermediate_code[code_line_number],$2);
											strcat(intermediate_code[code_line_number++],"\n");
										}

				| PRINT expression		 		{
											strcpy(intermediate_code[code_line_number++],"prt\n");
										}

				| VAR ASSIGN expression		{
												strcpy(intermediate_code[code_line_number],"sto ");
												strcat(intermediate_code[code_line_number],$1);
												strcat(intermediate_code[code_line_number++],"\n");
											}
		

;


condition :			| expression GREATER expression	{
														strcpy(intermediate_code[code_line_number++],"grt\n");
													}
					| expression LESS expression	{
														strcpy(intermediate_code[code_line_number++],"les\n");
													}
;

%%

#include<stdio.h>
#include<string.h>

extern FILE *yyin;

int main (int argc,char **argv)
{

	char output_file_name[20];
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

   	strcat(output_file_name, ".int");									/* a file with extension .g28.int for intermediate code */

	fp = fopen(output_file_name, "w");

	strcpy(intermediate_code[code_line_number++], "end\n");				/* appending end of file to intermediate code generated */

   	while(i < code_line_number)	{

      	fprintf(fp,"%s", intermediate_code[i++]);

   	}

	fclose(fp);

	return 0;
}

int yyerror (char *s) 	{ 												/* error case handling on parsing */

 printf ("ERROR: %s\n",s);

 return 0;
}
