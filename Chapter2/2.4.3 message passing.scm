; 2.4.3 Message passing
(define (make-from-real-imag x y)
    (define (dispatch op)
        (cond ((eq? op 'real-part) x)
              ((eq? op 'imag-part) y)
              ((eq? op 'magnitude)
                (sqrt (+ (square x) (square y))))
              ((eq? op 'angle) (atan y x))
              (else
                (error "Unknown op -- MAKE-FROM-REAL-IMAG" op))))
    dispatch)

((make-from-real-imag 2 3) 'angle)

(define (apply-generic op arg)
    (arg op))

(apply-generic 'angle (make-from-real-imag 2 3))