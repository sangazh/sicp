; Exercise 2.48

(define (make-segment vect1 vect2)
    (cons vect1 vect2))

(define (start-segment segment) (car segment))
(define (end-segment segment) (cadr segment))

(define seg1 (make-segment
               (make-vect 0 0)
               (make-vect 1 3)
               ))

seg1
(start-segment seg1)
(end-segment seg1)
