; Exercise 2.47
; using list
(define (make-frame origin edge1 edge2)
    (list origin edge1 edge2))

(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (cadr frame))
(define (edge2-frame frame) (caddr frame))

; using cons
(define (make-frame origin edge1 edge2)
    (cons origin (cons edge1 edge2)))

(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (cadr frame))
(define (edge2-frame frame) (cddr frame))

(define a-frame (make-frame (make-vect 0 0)
                            (make-vect 0 2)
                            (make-vect 5 0)
))

(origin-frame a-frame)
(edge1-frame a-frame)
(edge2-frame a-frame)