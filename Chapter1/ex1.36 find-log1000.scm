; Exercise 1.36

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (newline)
        (display (exact->inexact guess))
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess)
)

(define (find-log1000 x)
    (fixed-point (lambda (y) (/ (log 1000) (log y)))
                  x)
)
(find-log1000 5)
; 27 steps

;
(define (find-log1000 x)
    (fixed-point (lambda (y) (average y (/ (log 1000) (log y)) ))
                  x)
)
(find-log1000 5)
; 7 steps