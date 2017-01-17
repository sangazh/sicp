; Exercise 1.29
(define (simpson-integral f a b n)
	(define (h) (/ (- b a) n))
	(define (next n) (+ n 1))
	(define (term-inter k)
		(cond ((= k 0) (f (+ a (* k (h)))))
			  ((= k n) (f (+ a (* k (h)))))
			  ((even? k) (* 2 (f (+ a (* k (h))))))
			 (else (* 4 (f (+ a (* k (h)))))))
		)

	(* (/ (h) 3) (sum term-inter a next n) )
)

; note: h is defined function, cannot use directly

(simpson-integral cube 0 1 100) ; 1/4
(simpson-integral cube 0 1 1000) ; 1/4
; 精度显著提高了