; Exercise 1.23
(define (smallest-divisor n)
    (find-divisor n 2))
(define (find-divisor-fast n test-divisor)
    (cond ((> (square test-divisor) n) n)
    	((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next-divisor test-divisor)))) )
(define (next-divisor n)
    (if (= n 2)
          3
          (+ n 2)) )
(define (divides? a b)
    (= (remainder b a) 0))

(define (prime? n)
	(= n (smallest-divisor n))
)