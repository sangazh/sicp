; Exercise 2.83

; Tower of types
;
;    complex
;      ⬆
;     real
;      ⬆
;   rational
;      ⬆
;    integer


; general
(define (raise n) (apply-generic 'raise n))

;; install-scheme-number-package
(put 'raise '(integer) (lambda (x) (attach-tag 'rational (make-rational x 1))))

;; install-rational-package
(define (rational->real x)
    (make-real (/ (numer x) (denom x))))
(put 'raise '(rational) (lambda (x) (attach-tag 'real (rational->real x))))

;; install-real-package
(put 'raise '(real) (lambda (x) (attach-tag 'complex (make-complex-from-real-imag x 0))))



