puzzles
=======

* 2015/02/07 Sat src/boat.pl; A puzzle solving using Prolog; about a peasant sending a dog, a sheep, and a cabbage across a river.

```Prolog
> swipl -s wolf-sheep-cabbage/in-prolog/狼羊菜.prolog
Welcome to SWI-Prolog (threaded, 64 bits, version 8.4.3)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit https://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

1 ?- 始(Q), 終(A), 求(曰(Q), 曰(A)).
羊往 狼往 羊返 菜往 羊往 成
Q = 狼羊菜無無無,
A = 無無無狼羊菜 ;
羊往 菜往 羊返 狼往 羊往 成
Q = 狼羊菜無無無,
A = 無無無狼羊菜.
```
