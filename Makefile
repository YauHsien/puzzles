.phony: hanoi

hanoi:
	mkdir output || true
	gcc -o output/hanoi.a src/hanoi.c
