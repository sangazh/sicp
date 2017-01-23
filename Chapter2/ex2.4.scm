; Exercise 2.4
 (define (cons1 x y)
 	(lambda (m) (m x y)))

(define (car1 z)
	(z (lambda (p q) p))
)

(define (cdr1 z)
	(z (lambda (p q) q))
)

(define pair-a (cons1 2 3))
(display (car1 pair-a)) 2
(display (cdr1 pair-a)) 3

; verify
(car1 (cons1 x y))
(car1 (lambda (m) (m x y)))
((lambda (m) (m x y)) (lambda (p q) p))
((lambda (p q) p) x y)
