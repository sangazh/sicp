; 2.2.4 Painters
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