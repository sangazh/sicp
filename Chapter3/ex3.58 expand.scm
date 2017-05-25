; Exercise 3.58
(define (expand num den radix)
    (cons-stream
        (quotient (* num radix) den)
        (expand (remainder (* num radix) den) den radix)
    ))


(expand 1 7 10)
;(1 (expand 3 7 10))
;(1 4 (expand 2 7 10))
;(1 4 2 (expand 6 7 10))
;(1 4 2 8 (expand 4 7 10))
;(1 4 2 8 5 (expand 5 7 10))
;(1 4 2 8 5 7 (expand 1 7 10))
;(1 4 2 8 5 7 1 ... )

(expand 3 8 10)
;(3 (expand 6 8 10))
;(3 7 (expand 4 8 10))
;(3 7 5 (expand 0 8 10))
;(3 7 5 0 (expand 0 8 10))
;(3 7 5)

