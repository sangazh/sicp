; Exercise 2.34

(define (horner-eval x coefficient-sequence)
    (accumulate (lambda (this-coeff higher-terms)
                    (+ this-coeff (* higher-terms x) )
                )
                0
                coefficient-sequence
))


(horner-eval 2 (list 1 3 0 5 0 1))

; to verify
(define (f x)
    (+ 1 (* 3 x) (* 5 (expt x 3)) (expt x 5)))