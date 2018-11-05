Solution 1.1: 16
(load "/home/haroki/cs/01-programming/wizard/book/chapter-01/exercise-1-1.scm")

Solution 1.2: -37/150
(load "/home/haroki/cs/01-programming/wizard/book/chapter-01/exercise-1-2.scm")

Solution 1.3: Check the procedure iteself!
(load "/home/haroki/cs/01-programming/wizard/book/chapter-01/exercise-1-3.scm")

Solution 1.4:
Basically, the if will check if b is positive or negative. If it is negative then it will return the minus operator, since minus time minus is plus. Then it will be as if one were always doing the addition of both numbers.
(load "/home/haroki/cs/01-programming/wizard/book/chapter-01/exercise-1-2.scm")

Solution 1.5:
When using Applicative Order (AO), Ben will observe that `(test 0 (p))` hangs up! Probably one could hear the CPU fan going a bit crazy! The problem arises because `p` is a recursvie function without a break case. Since Applicative Order is used, it will evaluate it as an argument, but will never get a response.

On the other hand, Normal Order of Evaluation (NOE), won't evaluate the argument unless it is needed. If the logic of `test` is followed, then we observe that the branch of the `y` argument is never reached. Then, `p` is never evaluated.

Solution 1.6
The new if is not a special form anymore, but a plain function. Since Scheme uses AO, it will evalutate both arguments before applying the function. Since `sqrt-iter` is a recursive function, then the situation is similar to the previous exercise. Why if does not break? According to SICP:

>>> To evaluate an if expression, the interpreter starts by evaluating the <predicate> part of the expression. If the <predicate> evaluates to a true value, the interpreter then evaluates the <consequent> and returns its value. Otherwise it evaluates the <alternative> and returns its value.

Basically, the special form if has a Normal Applicative Order evaluation !!
