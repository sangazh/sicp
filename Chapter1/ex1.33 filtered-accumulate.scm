; Exercise 1.33
; iter
(define (filtered-accumulate filter combiner null-value term a next b)
    (define (iter a result)
       (if (> a b)
           result
           (if (filter a)
               (iter (next a) (combiner (term a) result))
               (iter (next a) result)
               )
           ))
    (iter a null-value))
; recur
(define (filtered-accumulate-recur filter combiner null-value term a next b)
    (if (> a b)
        null-value
        (if (filter a)
            (combiner (term a) (filtered-accumulate-recur filter combiner null-value term (next a) next b))
            (filtered-accumulate-recur filter combiner null-value term (next a) next b))
        ))

;a.
(define (sum-of-square-of-prime-between a b)
    (define (next n) (+ n 1))
    (filtered-accumulate prime? + 0 square a next b))

(sum-of-square-of-prime-between 2 5) ;38
(sum-of-square-of-prime-between 2 10) ;87

;b.
(define (product-of-positive-gcd a)
    (define (next n) (+ n 1))
    (define (GCD-inter n) (= (GCD n a) 1))
    (define (term-inter n) n)
    (filtered-accumulate GCD-inter * 1 term-inter 1 next a)
)
