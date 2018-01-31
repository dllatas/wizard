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

An expression as the previous one is called **combination**. It is described when a set of expressions are delimited within parenthesis. The element in the left is called an operator, in this case +. The remaining elements are called operands (1 and 99). The value of the operands are called arguments. A combination value is the operator applied to all the arguments.

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

Procedure definitions is a powerful abstraction that allows us to give a name to a compound operation, and therefore it can be used as a unit.

A compound procedure has the following form:

``` scheme
(define (<name> <formal parameters>) <body>)
```

Evaluating the definition creates this compound procedure and associates it with the name *name*.

There are two different operations being combined here: we are creating the procedure, and we are giving it the name *name*. It is possible, indeed important, to be able to separate these two notions -- to create procedures without naming them, and to give names to procedures that have already been created.

Compound procedures are used in exactly the same way as primitive procedures.

### 1.1.5 The Substitution Model for Procedure Application

The interpreter follows the same process with primitive and compound procedures.

1. To apply a compound procedure to arguments, evaluate the body of the procedure with each formal parameter replaced by the corresponding argument. 

``` scheme
(f 5)
(sum-of-squares (+ 5 1) (* 5 2))
(+ (square 6) (square 10))
(+ (* 6 6) (* 10 10))
(+ 36 100)
136
```

The substitution model is just one way the interpreter works. A way to get started thinking formally about the evaluation process. It helps us to think about procedure application, not to provide a description of how the interpreter really works.

#### Applicative order versus normal order

This alternative *fully expand and then reduce* evaluation method is known as normal-order evaluation, in contrast to the *evaluate the arguments and then apply* method that the interpreter actually uses, which is called applicative-order evaluation. The latter being more efficient.

**normal-order evaluation**
``` scheme
(f 5)
(sum-of-squares (+ 5 1) (* 5 2))
(+    (square (+ 5 1))      (square (* 5 2))  )
(+    (* (+ 5 1) (+ 5 1))   (* (* 5 2) (* 5 2)))
(+         (* 6 6)             (* 10 10))
(+           36                   100)
                    136
```
**applicative-order evaluation**
``` scheme
(f 5)
(sum-of-squares (+ 5 1) (* 5 2))
(+ (square 6) (square 10))
(+ (* 6 6) (* 10 10))
(+ 36 100)
136
```

### 1.1.6 Conditional Expressions and Predicates

So far, there is no way to make tests and act based on their results, which limits our expressive power. The name for this construction is called case analysis and Lisp provides support for it via a special form called *cond*.

**cond**
``` scheme
(cond 	(<p1> <e1>)
	(<p2> <e2>)
	...
	(<pn> <en>)
)
```

On the previous example, the pair of expressions in the parenthesis are called *clauses*. *p* stands for predicate. The main property of a predicate is that its value is interpreted or retruns true or false . *e* stands for consequent expression. Cond works as a sequence evaluating predicates until one is true. When that happens, it returns the value of the consequent expression. If all of them are false, the value returned is undefined.

This behaviour (returning undefined) somehow influenced the creation of the special symbol *else*. The symbol else takes place in the last clause of a cond. So, it will handle the case when the rest of the predicates were false.

Another reduction around cond, it's the special form *if*. It will focus on evaluating only two cases. This is the general form:

**if**
```scheme
(if <predicate> <consequent> <alternative>)
```

An example
```scheme
(define (abs x)
	(if (< x 0)
	    (-x)
	    x
	)
)
```
The interpreter will evaluate the predicate. If it is true, it will return the consequent.If it is false, it will return the alternative.

Predicates can turn into compound predicates by the use of logical composition operations. The ones more in use are:

1. And 
```scheme
( and <e1> <e2> ... <en>)
```

2. Or
```scheme
( or <e1> <e2> ... <en>)
```

3. Not
```scheme
( not <e>)
```

And and or are special forms since no all their subexpressions are neccesarilly evaluated. That's why they don't qualify as a procedure. However, not is a normal procedure.

### 1.1.7 Example: Square Roots by Newton's Method

This section seems relevant on the sense that it provides a comparison between mathematics and computer sciences. When the definition of the function to calculate square-roots is calculated, we realize that there is no info from there to actually perform the calculation.

The main difference between a function and a procedure is that the latter needs to be effective. This reflection is on the center of the distinction between declarative knowledge (describing properties) and imperative knowledge (describe how to do things). It can be said that Mathematics is declarative and computer sciences, imperative.

The idea of "good enough" is also presented. This represents a parameter that will provide a mesaure to determine when a result is fine, since the perfect answer might be too expensive to compute. Moreover, another powerful idea is that there is no need to have a special construct to perform an iteration; just by calling a procedure this can be accomplished. 
