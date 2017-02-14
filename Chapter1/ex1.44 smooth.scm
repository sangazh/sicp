; Exercise 1.44
(define (smooth f)
    (lambda (x) (/ (+ (f x)
                      (f (- x dx))
                      (f (+ x dx)))
                   3)))

(define (n-fold-smooth n)
    (repeat smooth n))

(((n-fold-smooth 2) square) 10)

;Value: 100.00000000013334