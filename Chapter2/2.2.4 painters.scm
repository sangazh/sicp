; 2.2.4 Painters
; depends on 2.2.4 Frames
(define (painter frame)
  body)

(define (draw-line point1 point2)
  body)

(define (segments->painter segment-list)
    (lambda (frame)
        (for-each (lambda (segment)
                    (line ((frame-coord-map frame) (start-segment segment))
                          ((frame-coord-map frame) (end-segment segment))))
                  segment-list)))


(line ((frame-coord-map a-frame) (start-segment seg1))
      ((frame-coord-map a-frame) (end-segment seg1)))