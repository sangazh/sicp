; Exercise 3.18
; depends on 3.13
(define (make-cycle x)
    (set-cdr! (last-pair x) x)
    x)

(define (check-loop x)
    (let ((temp '()))
        (define (helper x)
            (cond ((null? x) false)
                ((not (pair? x)) false)
                ((memq x temp) true)
                (else (set! temp (cons x temp))
                    (helper (cdr x)))))
        (helper x)))

(define z (make-cycle (list 'a 'b 'c)))
(check-loop z)