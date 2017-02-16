; Exercise 2.50
; depends on 2.4.2 transform-painter
(define (flip-horiz painter)
    (transform-painter painter
                       (make-vect 1 0)
                       (make-vect 0 0)
                       (make-vect 1 1)
))
(paint (flip-horiz wave))

(define (rotate180 painter)
    (transform-painter painter
                       (make-vect 1 1)
                       (make-vect 0 1)
                       (make-vect 1 0)))
(paint (rotate180 wave))

(define (rotate270 painter)
    (transform-painter painter
                       (make-vect 0 1)
                       (make-vect 0 0)
                       (make-vect 1 1)))
(paint (rotate270 wave))