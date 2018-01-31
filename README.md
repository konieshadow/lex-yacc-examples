# Lex and YACC examples

Practice code for examples in [Lex and YACC primer/HOWTO](https://ds9a.nl/lex-yacc/cvs/output/lexyacc.html) of myself.

### Compile Guide

#### Example1
```
lex example1.l
cc lex.yy.c -o example1 -ll
```

#### Example2
```
lex example2.l
cc lex.yy.c -o example2 -ll
```

#### Example3
```
lex example3.l
cc lex.yy.c -o example3 -ll

cat example3.txt | ./example3
```

#### Example4
```
lex example4.l
yacc -d example4.y
cc lex.yy.c y.tab.c -o example4
```

#### Example5
```
lex example5.l
yacc -d example5.y
cc lex.yy.c y.tab.c -o example5
```

#### Example6
```
lex example6.l
yacc -d example6.y
cc lex.yy.c y.tab.c -o example6

cat example6.txt | ./example6
```

#### Example7
```
lex example7.l
yacc -d example7.y
cc lex.yy.c y.tab.c -o example7
```