; Exercise 3.16
(define (count-pairs x)
    (if (not (pair? x))
        0
        (+ (count-pairs (car x))
           (count-pairs (cdr x))
           1)))

(define x (list 'a 'b))
(define z1 (cons x x))
(define z2 (cons (list 'a 'b) (list 'a 'b)))

(define (set-to-wow! x)
    (set-car! (car x) 'wow)
    x)

(set-to-wow! z2)
(count-pairs x)
(count-pairs z1)
(count-pairs z2)
(count-pairs (set-to-wow! z2))