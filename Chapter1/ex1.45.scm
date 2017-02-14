; Exercise 1.45

(define (4th x) (* x x x x))

; not using repeat, can not use
(define (4th-root x)
    (fixed-point (average-damp (lambda (y) (/ x (cube y))))
                1.0 ))

; repeat twice
(define (4th-root x)
    (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* y y y))))
                1.0 ))

; ------------
; x^n  <---- expt
;(define (nth x n)
;   (product (lambda (y) x) 1 (lambda (y) (+ y 1)) n)
;)

(define (nth-root x n)
    (fixed-point ((repeated average-damp (floor (sqrt n))) (lambda (y) (/ x (expt y (- n 1))))
                        )
                1.0 ))
