; Exercise 2.1
(define (make-rat n d)
	(let ((g (gcd n d)))
		(if (and (< g 0))
		    (cons (/ n (- g)) (/ d (- g)))
		    (cons (/ n g) (/ d g)))
	))

; Test
(define minus-2-3 (make-rat -2 -3))

(numer minus-2-3)

;Value: -2

(denom minus-2-3)

;Value: -3
