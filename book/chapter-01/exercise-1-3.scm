(define (square x)
    ( * x x)
)

(define (sum-of-squares x y)
    (+ (square x) (square y))
)

(define (greater x y z)
    (
        cond 
            ( (and (>= x y) (>= y z)) (sum-of-squares x y) )
            ( (and (>= x y) (>= z y)) (sum-of-squares x z) )
            ( (and (>= y z) (>= z x)) (sum-of-squares y z) )
            ( (and (>= y z) (>= x z)) (sum-of-squares y x) )
            ( (and (>= z x) (>= x y)) (sum-of-squares z x) )
            ( (and (>= z x) (>= y x)) (sum-of-squares z y) )
    )
)


