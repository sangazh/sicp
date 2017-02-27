; Exercise 2.75
(define (make-from-mag-ang r a)
	(define (dispatch op)
	    (cond ((eq? op 'angle) a)
	          ((eq? op 'magnitude) r)
	          ((eq? op 'real-part) (* r (cos a)))
	          ((eq? op 'imag-part) (* r (sin a)))
	      ))
	dispatch)