; 2.2.4 Frames

; make-frame
; frame-origin
; frame-edge1
; frame-edge2
; ref resources/2.2.4/hend.scm
; these procedures are already build-in in DrRacket

(define (frame-coord-map frame)
    (lambda (v)
        (add-vect (origin-frame frame)
                  (add-vect (scale-vect (xcor-vect v)
                                        (edge1-frame frame))
                            (scale-vect (ycor-vect v)
                                        (edge2-frame frame))))))

((frame-coord-map a-frame) (make-vect 0 0))

(define a-frame
    (make-frame (make-vect 0 0)
                (make-vect 0 2)
                (make-vect 1 3)))

(frame-origin a-frame)
(frame-edge1 a-frame)
(frame-edge2 a-frame)

