; Exercise 2.44
; ref: http://www.billthelizard.com/2011/08/sicp-244-245-picture-language.html
; Download full version of racket, via https://download.racket-lang.org/
; Run DrRacket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(paint einstein)
(paint (beside einstein einstein))
(paint (below einstein einstein))
(paint (rotate90 einstein))
(paint (flip-vert einstein))
(paint (flip-horiz einstein))

(define (flipped-pairs painter)
    (let ((painter2 (beside painter (flip-vert painter))))
        (below painter2 painter2)))

(paint (flipped-pairs einstein))

(define (right-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (right-split painter (- n 1))))
            (beside painter (below smaller smaller)))))

(paint (right-split einstein 2))

; exercise answer
(define (up-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (up-split painter (- n 1))))
            (below painter (beside smaller smaller)))))

(paint (up-split einstein 2))

; used for test
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

(paint (corner-split einstein 2))

(define (square-limit painter n)
    (let ((quarter (corner-split painter n)))
        (let ((half (beside (flip-horiz quarter) quarter)))
            (below (flip-vert half) half))))


(paint (square-limit einstein 2))