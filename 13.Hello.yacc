%{
  #include "y.tab.h"
  int yyerror(char *errormsg);
  int yyparse();
%}
  
%%

("hi"|"oi")"\n"       { return HI;  }
("tchau"|"bye")"\n"   { return BYE; }
[-[]+.,><]            { return yytext[0]; }
.                     { yyerror("Unknow char");  }

%%

int main(void)
{
     yyparse();
     return 0;
}

int yywrap(void)
{
     return 0;
}

int yyerror(char *errormsg)
{
      fprintf(stderr, "%s\n", errormsg);
      exit(1);
}
hello.y
%{

  #include <stdio.h>
  #include <stdlib.h>
  int yylex(void);
  int yyerror(const char *s);

%}

%token HI BYE

%%

program:
         hi bye
        ;

hi:
        HI     { printf("Hello World\n");   }
        ;
bye:
        BYE    { printf("Bye World\n"); exit(0); }
         ;
makefile
# Autoversion makefile Version 171129.082609
# (C) 2011-2017 by Ruben Carlo Benante
# GPL v2
#
# lexical analysis and syntactic analysis
# of a very small program for a 
# hellow world example

CC = gcc
LIB = -lfl -L/usr/local/opt/flex/lib
o ?= hello

all: $(o).x

lex: lex.yy.c

bison: y.tab.c

yacc: bison

lex.yy.c: $(o).l
	flex $(o).l 
	
y.tab.c: $(o).y
	bison -dy $(o).y

y.tab.h: $(o).y

$(o).x: lex.yy.c y.tab.c y.tab.h
	$(CC) lex.yy.c y.tab.c -o $(o).x $(LIB)

clean:
	rm -rf lex.yy.c
	rm -rf y.tab.c
	rm -rf y.tab.h
	rm -rf $(o).x
