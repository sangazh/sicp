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