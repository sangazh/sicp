; Exercise 1.16
(define (even? n)
  (= (remainder n 2) 0))

(define (expt-iter b n)
	(fast-expt-iter b 1 n)
)

(define (fast-expt-iter b product divider)
	(cond ((= divider 1) (* b product))
	      ((even? divider) (fast-expt-iter (* b b) product (/ divider 2)))
	      (else (fast-expt-iter (* b b) (* product b) (/ (- divider 1) 2) ))
))

; 实际上是b^2 累乘