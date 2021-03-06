; 2.2.4 Example: A Picture Language
; primitive
; painter
; wave
; rogers

(beside painter1 painter2)
(below painter1 painter2)
(flip-vert painter)
(flip-horiz painter)

(define wave2 (beside wave (flip-vert wave)))
(define wave4 (below wave2 wave2))

(define (flipped-pairs painter)
    (let ((painter2 (beside painter (flip-vert painter))))
        (below painter2 painter2)))

(define wave4 (flipped-pairs wave))

; up-split -> see ex2.44

(define (right-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (right-split painter (- n 1))))
            (beside painter (below smaller smaller)))))

(define (corner-split painter n)
    (if (= n 0)
        painter
        (let ((up (up-split painter (- n 1)))
              (right (right-split painter (- n 1))))
            (let ((top-left (beside up up))
                  (bottom-right (below right right))
                  (corner (corner-split painter (- n 1))))
                (beside (below painter top-left)
                        (below bottom-right corner)
                )))))

(define (square-limit painter n)
    (let ((quarter (corner-split painter n)))
        (let ((half (beside (flip-horiz quarter) quarter)))
            (below (flip-vert half) half))))

; Higher-order operations

(define (square-of-four tl tr bl br)
    (lambda (painter)
        (let ((top (beside (tl painter) (tr painter)))
              (bottom (beside (bl painter) (br painter))))
            (below bottom top))))

(define (flipped-pairs painter)
    (let ((combine4 (square-of-four identity flip-vert identity flip-vert)))
        (combine4 painter)))

(define (square-limit  painter n)
    (let ((combine4 (square-of-four flip-horiz identity rotate180 flip-vert)))
        (combine4 (corner-split painter n))))

(paint (square-limit einstein 2))

;Frames
; make-vect -> see ex2.46
; add-vect
; sub-vect
; scale-vect
;
; make-frame -> see ex2.47
; origin-frame
; edge1-frame
; edge2-frame

(define (frame-coord-map frame)
    (lambda (v)
        (add-vect (origin-frame frame)
                  (add-vect (scale-vect (xcor-vect v)
                                        (edge1-frame frame))
                            (scale-vect (ycor-vect v)
                                        (edge2-frame frame))))))

((frame-coord-map a-frame) (make-vect 0 0))

;Painters

(define (painter frame)
  body)

; draw-line
(define (draw-line point1 point2)
  body)

; make-segment -> see ex2.48
; start-segment
; end-segment
(define (segments->painter segment-list)
    (lambda (frame)
        (for-each (lambda (segment)
                    (draw-line ((frame-coord-map frame) (start-segment segment))
                               ((frame-coord-map frame) (end-segment segment))))
                  segment-list)))

; Transforming and combing painters
(define (transform-painter painter origin corner1 corner2)
    (lambda (frame)
        (let ((m (frame-coord-map frame)))
            (let ((new-origin (m origin)))
                (painter (make-frame new-origin
                                     (sub-vect (m corner1) new-origin)
                                     (sub-vect (m corner2) new-origin)))))))

(define (flip-vert painter)
    (transform-painter painter
                       (make-vect 0 1)
                       (make-vect 1 1)
                       (make-vect 0 0)
                       ))

(define (shrink-to-upper-right painter)
    (transform-painter painter
                       (make-vect 0.5 0.5)
                       (make-vect 1 0.5)
                       (make-vect 0.5 1)
                       ))

(define (rotate90 painter)
    (transform-painter painter
                       (make-vect 1 0)
                       (make-vect 1 1)
                       (make-vect 0 0)))

(define (squash-inwards painter)
    (transform-painter painter
                       (make-vect 0 0)
                       (make-vect 0.65 0.35)
                       (make-vect 0.35 0.65)))

(define (beside painter1 painter2)
    (let ((split-point (make-vect 0.5 0)))
        (let ((paint-left
                (transform-painter painter1
                                   (make-vect 0 0)
                                   split-point
                                   (make-vect 0 1)))
               (paint-right
                 (transform-painter painter2
                                    split-point
                                    (make-vect 1 0)
                                    (make-vect 0.5 1))))
            (lambda (frame)
              (paint-left frame)
              (paint-right frame)))))
