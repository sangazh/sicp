; Exercise 2.51
; first
(define (below painter1 painter2)
    (let ((split-point (make-vect 0 0.5)))
        (let ((paint-up
                (transform-painter painter1
                                   split-point
                                   (make-vect 1 0.5)
                                   (make-vect 0 1)))
              (paint-bottom
                (transform-painter painter2
                                   (make-vect 0 0)
                                   (make-vect 1 0)
                                   split-point)))
            (lambda (frame)
                (paint-bottom frame)
                (paint-up frame)
                ))))

(paint (below wave wave))

; second
(define (below painter1 painter2)
    (rotate270 (beside (rotate90 painter1) (rotate90 painter2))))

(paint (below wave wave))