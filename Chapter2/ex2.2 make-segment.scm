; Exercise 2.2 线段

(define (make-segment start end)
    (cons start end))

(define (start-segment x)
    (car x))
(define (end-segment x)
    (cdr x))

(define (make-point x y)
    (cons x y))

(define (x-point p)
    (car p))
(define (y-point p)
    (cdr p))

(define (midpoint-segment line)
    (make-point (average (x-point (start-segment line))
                         (x-point (end-segment line)))
                (average (y-point (start-segment line))
                         (y-point (end-segment line))) ))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

(define p1 (make-point 1 1))
(define p2 (make-point 5 8))

(define l1 (make-segment p1 p2))
(print-point (midpoint-segment l1))
