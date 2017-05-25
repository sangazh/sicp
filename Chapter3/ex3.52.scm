; Exercise 3.52
(define sum 0)
(define (accum x)
    (set! sum (+ x sum))
    sum)
(define seq
    (stream-map accum (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))
(stream-ref y 7)
; 90
(display-stream z)

; sum = 210