; Exercise 1.32
; a. iter
(define (accumulate combiner null-value term a next b)
    (define (iter a result)
       (if (> a b)
           result
           (iter (next a) (combiner (term a) result))))
    (iter a null-value))

; sum => (accumulate + 0 term a next n)
; product => (accumulate * 1 term a next n)

; b. recur
(define (accumulate-recur combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a) (accumulate combiner null-value term (next a) next b)))
)

; use simpton-integral to test
(define (simpson-integral-accu f a b n)
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

    (* (/ (h) 3) (accumulate + 0 term-inter a next n) )
)

(define (simpson-integral-accu-recur f a b n)
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

    (* (/ (h) 3) (accumulate-recur + 0 term-inter a next n) )
)

(simpson-integral-accu cube 0 1 1000)
(simpson-integral-accu-recur cube 0 1 1000)
