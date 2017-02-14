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
