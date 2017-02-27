; Exercise 2.77
; Besides, polar and rectangular packages are needed.

(define (install-complex-package)
    ;; imported procedures from rectangular and polar packages
    (define (make-from-real-imag x y)
        ((get 'make-from-real-imag 'rectangular) x y))
    (define (make-from-mag-ang r a)
        ((get 'make-from-mag-ang 'polar) r a))
    ;; internal procedures
    (define (add-complex z1 z2)
        (make-from-real-imag (+ (real-part z1) (real-part z2))
                             (+ (imag-part z1) (imag-part z2))))

    (define (sub-complex z1 z2)
        (make-from-real-imag (- (real-part z1) (real-part z2))
                             (- (imag-part z1) (imag-part z2))))

    (define (mul-complex z1 z2)
        (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                           (+ (angle z1) (angle z2))))

    (define (div-complex z1 z2)
        (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                           (- (angle z1) (angle z2))))

    ;; interface to rest of the system
    (define (tag z) (attach-tag 'complex x))
    (put 'add '(complex complex) (lambda (z1 z2) (tag (add-complex z1 z3))))
    (put 'sub '(complex complex) (lambda (z1 z2) (tag (sub-complex z1 z3))))
    (put 'mul '(complex complex) (lambda (z1 z2) (tag (mul-complex z1 z3))))
    (put 'div '(complex complex) (lambda (z1 z2) (tag (div-complex z1 z3))))
    (put 'make-from-real-imag 'complex (lambda x y) (tag (make-from-real-imag x y)))
    (put 'make-from-mag-ang 'complex (lambda r a) (tag (make-from-mag-ang r a)))

    (put 'real-part '(complex) real-part)
    (put 'imag-part '(complex) imag-part)
    (put 'magnitude '(complex) magnitude)
    (put 'angle '(complex) angle)

    'done
    )

(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (apply proc (map contents args))
                (error "No method for these types -- APPLY-GENERIC" (list op type-tags))
            ))))

(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))


(define z (cons 'complex (cons 'rectangular (cons 3 4))))
(magnitude z)
(magnitude '(complex rectangular 3 . 4))

; first time, complex
(apply-generic 'magnitude '(complex rectangular 3 . 4))
(apply (get 'magnitude '(complex)) (contents '(complex rectangular 3 . 4)))
(magnitude '(rectangular 3 . 4))

; second time, rectangular
(apply-generic 'magnitude '(rectangular 3 . 4))
(apply (get 'magnitude '(rectangular)) (contents '(rectangular 3 . 4)))

; Answer is twice.
