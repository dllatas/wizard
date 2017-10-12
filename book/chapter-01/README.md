* [Home](../..)

# Chapter 01: Building Abstractions with Procedures

A computational process, an abstract being, is directed by a pattern of rules called programs and they could manipulate data, another abstract being.

In order to write a program, one uses a programming language. It is a set of symbolic expressions.

Writing a program can lead to mistakes that are known as bugs. Bugs can happen because of different reasons, and their consequences are usually chaotic. That's the reason software is built in a modular fashion, so that the parts can be constructed, replaced, and debugged separately.

### Programming in LISP

Human beings use a language for everyday thoughts, mathematical notation for quantitative issues, and now one will use a programming language for our procedural thoughts. This book us built around LISP.

LISP is the academic result of John McCarthy's research about a computational model called "recursion equations" in 1950's. [Recursive Functions of Symbolic Expressions and Their Computation by Machine (McCarthy 1960)](http://www-formal.stanford.edu/jmc/recursive.pdf). LISP stands for List Processing.

Nowadays, LISP is a family of dialects rather than a language itself. Given its flexibility and its community over time that focus on not having formal definitions for it. The dialect used on this book is called Scheme. 

Although LISP is not as efficient for numerical processing as other programming langauges (e. Fortran), it is going to be used because it posses some unique features: procedures as 1st class citizens, which it's extremely important to write interpreters and compilers.

## 1.1 The Elements of Programming

A language does not work only as a means to instruct a machine, but it represents a framework to organize our ideas about processes. In order to achieve this, it has three main mechanisms:

1. Primitive Expressions, simplest entities.
2. Means of Combination, compound elements are built from simpler ones.
3. Means of Abstraction, compound elements can be represented as units.

Moreover, there are two main elements:

1. Data, stuff that one wants to manipulate
2. Procedures, descriptions of the rules to manipulate data.

### 1.1.1 Expressions

This expression consists of a numeral that represents a number in base 10. 

``` scheme
99
```

A compound expression involves simpler expressions as the previous one

``` scheme
(+ 1 99)
```

An expression as the previous one is called ** combination **. It is described when a set of expressions are delimited within parenthesis. The element in the left is called an operator, in this case +. The remaining elements are called operands (1 and 99). The value of the operands are called arguments. A combination value is the operator applied to all the arguments.

While the notation introduced is not the conventional mathematical one, prefix notation main benefit is that there is no ambiguity on it. And it extends itself without issues:

``` scheme
( * (+ 1 99) (- 1 1))
```
*0*

There is no limit more than the human capability to make sense of this combination. Scheme follows the pretty-printing convention, that states that operands are alligned vertically.

The interpreter will follow the (Read - Eval - Print) Loop. So it reads the expression from the terminal, evaluates the expression, and prints its value.

### 1.1.2  Naming and the Environment