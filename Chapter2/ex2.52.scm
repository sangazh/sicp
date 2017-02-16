; Exercise 2.52
; a

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
    (make-segment (make-vect 0.5 0.3) (make-vect 0.4 0))

    ; eye
    (make-segment (make-vect 0.38 0.92) (make-vect 0.41 0.93))

	;smile
    (make-segment (make-vect 0.37 0.75) (make-vect 0.45 0.78))
))

(define wave (segments->painter wave-segments))
(paint wave)

; b
(define (corner-split-b painter n)
	(if (= n 0)
	    painter
	    (let ((up (up-split painter (- n 1)))
	    	  (right (right-split painter (- n 1)))
	    	  (corner (corner-split-b painter (- n 1))))
	    	(beside (below painter up)
	    		    (below right corner)
	    	))))

(paint (corner-split einstein 2))
(paint (corner-split-b einstein 2))

; c
(define (square-of-four tl tr bl br)
    (lambda (painter)
        (let ((top (beside (tl painter) (tr painter)))
              (bottom (beside (bl painter) (br painter))))
            (below bottom top))))

(define (square-limit-c  painter n)
    (let ((combine4 (square-of-four flip-vert rotate180 identity flip-horiz)))
        (combine4 (corner-split painter n))))

(paint (square-limit-c einstein 2))
(paint (square-limit einstein 2))

