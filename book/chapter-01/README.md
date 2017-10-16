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

A name identifies a variables. The value of the variable is a computational object.

``` scheme
(define size 5)
```

Now we cna use the variable *size* around, instead of using directly the number 5. The power of this abstraction is to name very complex computational objects. With this abastraction, there is no need to repeat the logic of a complex object.

The interpreter has a "memory" to associate names with objects. This memory is called environment. In this case, it is the global one.

### 1.1.3 Evaluating Combinations

Even the interpreter follows a procedure to provide a result. It follows two rules:

1. Evaluate the subexpressions of the combination.

2. Apply the procedure that is the value of the leftmost subexpression (the operator) to the arguments that are the values of the other subexpressions (the operands).

This rule to evaluate is recursive, one of its step is to call itself again. Recursion is a very powerful technique for dealing with hierarchical, treelike objects. In fact, the ``percolate values upward'' form of the evaluation rule is an example of a general kind of process known as tree accumulation.

From before, it can be infered that the evaluation happens on the primitive forms:

1. The values of numerals are the numbers that they name.

2. The values of built-in operators are the machine instruction sequences that carry out the corresponding operations, and

3. The values of other names are the objects associated with those names in the environment.

So, an environment gives context to certain expressions. For instance, the value of *x* is undefined without a context. 

``` scheme
(+ x 1)
```

The evaluation rule of the interpreter does not apply to special forms such as define. Each special form has its own evaluation rule. The set of expressions and its evaluation rule constitutes the programming language's syntax.

### 1.1.4 Compound Procedures