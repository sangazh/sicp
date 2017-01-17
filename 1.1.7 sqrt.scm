;1.1.7 Example: Square Roots by Newton's Method

(define (average a b) (/ (+ a b) 2))
(define (square x) (* x x))
(define (abs x) (if (> x 0) x (- x)))

;procedure:
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
x)))

(define (improve guess x) (average guess (/ x guess)))

(define (good-enough? guess x)
 (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))



; Exercise 1.6
;(define (new-if predicate then-clause else-clause)
;  	(cond (predicate then-clause)
;        (else else-clause)))

;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;          guess
;          (sqrt-iter (improve guess x)
; x)))

; Exercise 1.7
(define (sqrt x)
  (sqrt-iter 1.0 0.0 x))

(define (precise-enough? guess old-guess precision)
 (<= (abs (- guess old-guess)) precision))

(define (sqrt-iter guess old-guess x)
  (if (precise-enough? guess old-guess 0.00001)
      guess
      (sqrt-iter (improve guess x) guess x
)))
