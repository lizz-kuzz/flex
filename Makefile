stasyan: stasyan.l
	flex stasyan.l
	g++ main.cpp lexer.cpp lex.yy.c -lfl -o stasyan 
	
