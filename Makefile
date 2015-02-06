.phony: hanoi boat

hanoi:
	mkdir output || true
	gcc -o output/hanoi.a src/hanoi.c

boat:
	swipl -g question,halt -l src/boat.pl
