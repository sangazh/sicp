; Exercise 2.49
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

; alternative, no need to draw actual line,
;(define (draw-line x y)
;  (printf "line from ~v to ~v" x y)
;  (newline))

; a.
(define outline-segments
  (list
    (make-segment (make-vect 0 0) (make-vect 0 1))
    (make-segment (make-vect 0 0) (make-vect 1 0))
    (make-segment (make-vect 1 0) (make-vect 1 1))
    (make-segment (make-vect 0 1) (make-vect 1 1))
))

(define outline-painter (segments->painter outline-segments))

(paint outline-painter)

; b
(define x-segments
    (list
        (make-segment (make-vect 0 0) (make-vect 1 1))
        (make-segment (make-vect 0 1) (make-vect 1 0))))

(define x-painter (segments->painter x-segments))
(paint x-painter)

; c

(define diamond-segments
    (list
        (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
        (make-segment (make-vect 1 0.5) (make-vect 0.5 1))
        (make-segment (make-vect 0.5 1) (make-vect 0 0.5))
        (make-segment (make-vect 0 0.5) (make-vect 0.5 0))))

(define diamond-painter (segments->painter diamond-segments))
(paint diamond-painter)

; d
(define wave-segments
  (list
    (make-segment (make-vect 0.25 0) (make-vect 0.35 0.5))
    (make-segment (make-vect 0.3 0.6) (make-vect 0.35 0.5))
    (make-segment (make-vect 0.3 0.6) (make-vect 0.15 0.4))
    (make-segment (make-vect 0 0.64) (make-vect 0.15 0.4))
    (make-segment (make-vect 0.15 0.6) (make-vect 0 0.84))
    (make-segment (make-vect 0.15 0.6) (make-vect 0.3 0.65))
    (make-segment (make-vect 0.4 0.65) (make-vect 0.3 0.65))
    (make-segment (make-vect 0.4 0.65) (make-vect 0.34 0.85))
    (make-segment (make-vect 0.4 1) (make-vect 0.34 0.85))
    (make-segment (make-vect 0.65 0.85) (make-vect 0.6 1))
    (make-segment (make-vect 0.65 0.85) (make-vect 0.6 0.65))
    (make-segment (make-vect 0.75 0.65) (make-vect 0.6 0.65))
    (make-segment (make-vect 0.75 0.65) (make-vect 1 0.36))
    (make-segment (make-vect 1 0.16) (make-vect 0.6 0.46))
    (make-segment (make-vect 0.75 0) (make-vect 0.6 0.46))
    (make-segment (make-vect 0.5 0.3) (make-vect 0.6 0))
    (make-segment (make-vect 0.5 0.3) (make-vect 0.4 0))))

(define wave (segments->painter wave-segments))
(paint wave)

; test
(define wave2 (beside wave (flip-vert wave)))
(define wave4 (below wave2 wave2))
(paint wave2)
(paint wave4)