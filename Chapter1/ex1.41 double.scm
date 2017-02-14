; Exercise 1.41
(define (inc n) (+ n 1))

(define (double f)
    (lambda (x) (f (f x))))

(((double (double double)) inc) 5)
;Value: 21

