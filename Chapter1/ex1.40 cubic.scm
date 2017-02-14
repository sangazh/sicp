;Exercise 1.40
; depends on 1.3.4 Newton's method
(define (cubic a b c)
    (newton-method (lambda (y) (+ (cube y) (* a (square y)) (* b y) c))
    1))
