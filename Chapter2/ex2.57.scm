; Exercise 2.57
(define (addend s) (cadr s))

(define (augend s)
    (let ((second (caddr s))
          (rest (cdddr s)))
        (if (null? rest)
            second
            (cons '+ (cons second rest)))))

(define (multiplier p) (cadr p))
(define (multiplicand p)
    (let ((second (caddr p))
          (rest (cdddr p)))
        (if (null? rest)
            second
            (cons '* (cons second rest)))))

(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '(* x y (+ x 3)) 'x)
;(+ (* x y) (* y (+ x 3)))