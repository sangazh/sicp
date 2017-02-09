; Exercise 1.43
; depends on 1.42 compose
(define (repeated f n)
    (if (= n 1)
        (lambda (x) (f x))
        (compose f (repeated f (- n 1))))
)

((repeated square 2) 5)

;Value: 625

((repeated square 3) 5)

;Value: 390625