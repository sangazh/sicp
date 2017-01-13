; Exercise 1.31
; a. 累乘 类似 iterative的累加
(define (product term a next b)
	(define (iter a result)
	  (if (> a b)
		result
		(iter (next a) (* (term a) result))
	))
	(iter a 1)
)

; b. recursive 的product
(define (product-recur term a next b)
	(if (> a b)
	    1
	    (* (term a) (product-recur term (next a) next b)))
  	)

; factorial
(define (factorial n)
	(define (term-inter k) k )
	(define (next k) (+ k 1))
	(product term-inter 1 next n)
  	)

; factorial recursive
(define (factorial-recur n)
	(define (term-inter k) k )
	(define (next k) (+ k 1))
	(product-recur term-inter 1 next n))

; π
; n/d numerator/denominator 分子/分母
(define (pai n)
	(define (next k) (+ k 1))
	(define (numerator-inter k)
		(if (even? k)
		    (+ k 2)
		    (+ k 1)))
	(define (denominator-inter k)
		(if (even? k)
		    (+ k 1)
		    (+ k 2)))

	(define (pai-inter)
		(/ (product numerator-inter 1 next n) (product denominator-inter 1 next n))
	)
	(exact->inexact (* 4 (pai-inter)))
)

(pai 1000)