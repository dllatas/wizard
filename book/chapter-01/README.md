* [Home](../..)

# Chapter 01: Building Abstractions with Procedures

A computational process, an abstract being, is directed by a pattern of rules called programs and they could manipulate data, another abstract being.

In order to write a program, one uses a programming language. It is a set of symbolic expressions.

Writing a program can lead to mistakes that are known as bugs. Bugs can happen because of different reasons, and their consequences are usually chaotic. That's the reason software is built in a modular fashion, so that the parts can be constructed, replaced, and debugged separately.

### Programming in LISP

Human beings use a language for everyday thoughts, mathematical notation for quantitative issues, and now one will use a programming language for our procedural thoughts. This book us built around LISP.

LISP is the academic result of John McCarthy's research about a computational model called "recursion equations" in 1950's. [Recursive Functions of Symbolic Expressions and Their Computation by Machine (McCarthy 1960)](http://www-formal.stanford.edu/jmc/recursive.pdf). LISP stands for List Processing.

Nowadays, LISP is a family of dialects rather than a language itself. Given its flexibility and its community over time that focus on not having formal definitions for it. The dialect used on this book is called Scheme. 

Although LISP is not as efficient for numerical processing as other programming langauges (e. Fortran), it is going to be used because it posses some unique features: procedures as 1st class citizens, which it's extremely handy when it comes to writing interpreters and compilers.