; Exercise 1.38
; depends on ex1.37 cont-grac
;i:  1 2 3 4 5 6 7 8 9
;d:  1,2,1,1,4,1,1,6,1

(define (d i)
    (let ((remainder-value (remainder i 3))
        (q (quotient i 3))
        )
        (cond ((= 1 remainder-value) 1)
              ((= 2 remainder-value) (* 2 (+ q 1)))
              ((= 0 remainder-value) 1))
        )
)

; (cont-grac n d k)
; assume cont-grac maximum k is 1000,then
(define (e)
    (+ 2 (cont-grac (lambda (i) 1.0) d 1000))
)

(e)
;Value: 2.7182818284590455