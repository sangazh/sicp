; Exercise 1.30 iterative

(define (sum-iter term a next b) ; a 递增底数 b 上限
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (+ (term a) result))
		))
	(iter a 0)
)

(define (simpson-integral-2 f a b n)
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

	(* (/ (h) 3) (sum-iter term-inter a next n) )
)

(simpson-integral-2 cube 0 1 100) ; 1/4


