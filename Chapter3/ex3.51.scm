; Exercise 3.51

(define (show x)
    (display-line x)
    x)

(define x (stream-map show (stream-enumerate-interval 0 10)))
;10 ,9,8, ... 0 x
(stream-ref x 5)
; 5
(stream-ref x 7)
; 7

(define y (stream-map show (stream-enumerate-interval 1000 10000)))
(stream-ref y 5)
(stream-ref y 102)