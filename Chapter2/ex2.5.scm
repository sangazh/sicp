; Exercise 2.5
(define (cons2 a b)
	(* (expt 2 a) (expt 3 b)))

(define (div-num a b)
	(define (iter a count)
		(if (= 0 (remainder a b))
			(iter (/ a b) (+ count 1))
	  		count))
	(iter a 0))

(define (car2 x)
	(div-num x 2))

(define (cdr2 x)
	(div-num x 3))

(define c (cons2 2 5))
(car2 c)
(cdr2 c)

