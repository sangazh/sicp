; Exercise 2.45
; depends on ex2.44
(define (split split1 split2)
    (lambda (painter n)
        (if (= n 0)
            painter
            (let ((smaller ((split split2 split1) painter (- n 1))))
            (split1 painter (split2 smaller smaller))))
    ))

(define right-split (split beside below))
(define up-split (split below beside))

(paint (right-split einstein 2))
(paint (up-split einstein 2))