; Exercise 1.36
; note n, d are procedures
; a. recursive
(define (cont-grac-recur n d k)
    (define (term-inter i)
        (if (> i k)
            0
            (/ (n i) (+ (d i) (term-inter n d k (+ i 1)))))
        )
    (term-inter 1)
)

(cont-grac-recur (lambda (i) 1.0) (lambda (i) 1.0) 20)

; b. iterative
(define (cont-grac n d k)
    (define (term-inter n d i result)
        (let ((next-result (/ (n i) (+ (d i) result))))
            (if (= i 0)
            result
            (term-inter n d (- i 1) next-result)
            )))
    (term-inter n d k 0)
)

(cont-grac (lambda (i) 1.0) (lambda (i) 1.0) 20)

; -------
(cont-grac (lambda (i) 1.0) (lambda (i) 1.0) 10)

;Value: .6179775280898876

(cont-grac (lambda (i) 1.0) (lambda (i) 1.0) 11)

;Value: .6180555555555556

(cont-grac (lambda (i) 1.0) (lambda (i) 1.0) 12)

;Value: .6180257510729613

; Thus, in order to get 4 decimal places accurate, k = 11 can be satisfactory.