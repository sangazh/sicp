; Exercise 3.17

(define (count-pairs x)
	(let ((encountered '()))
		(define (helper x)
		    (if (or (not (pair? x)) (memq x encountered))
		        0
		        (begin (set! encountered (cons x encountered))
		        	   (+ (helper (car x)) (helper (cdr x)) 1)
		        )))
    (helper x)))


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