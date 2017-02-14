; 1.2.2 Tree Recursion
; recursive
(define (fib n)
    (cond ((< n 2) n)
        (else ((+ fib (- n 1) fib (- n 2))))
        ))

;iterative

(define (fib n)
    (define (fib-iter a b n)
       (if (= n 0)
           b
           (fib-iter b (+ a b) (- n 1))))
    (fib-iter 1 0 n)
  )

