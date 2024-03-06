stasyan: stasyan.l
	@flex stasyan.l
	@g++ lex.yy.c -lfl -o stasyan 
	
