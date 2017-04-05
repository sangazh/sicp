; Exercise 3.2
(define (make-monitored f)
	(define counter 0)
	(define (mf m)
		(cond ((eq? m 'how-many-calls?) counter)
		      ((eq? m 'reset-count) (set! counter 0))
		      (else (set! counter (+ counter 1))
		      		(f m))))
	mf
)

(define s (make-monitored sqrt))
(s 100)
(s 'how-many-calls?)