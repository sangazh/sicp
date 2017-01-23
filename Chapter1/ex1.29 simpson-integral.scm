; Exercise 1.29 求积分
(define (simpson-integral f a b n)
	(define (h) (/ (- b a) n))
	(define (next n) (+ n 1))
	(define (y k)
		(f (+ a (* k (h)))))
	(define (term-inter k)
		(cond ((= k 0) (y k))
			  ((= k n) (y k))
			  ((even? k) (* 2 (y k)))
			 (else (* 4 (y k))))
		)

	(* (/ (h) 3) (sum term-inter a next n) )
)

; note: h is defined function, cannot use directly

(simpson-integral cube 0 1 100) ; 1/4
(simpson-integral-accu-recur cube 0 1 1000) ; 1/4
; 精度显著提高了


