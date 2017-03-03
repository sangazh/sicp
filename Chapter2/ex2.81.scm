; Exercise 2.81
(define (scheme-number->scheme-number n) n)
(define (complex->complex z) z)
(put-coercison 'scheme-number 'scheme-number scheme-number->scheme-number)
(put-coercison 'complex 'complex complex->complex)

(define (exp x y) (apply-generic 'exp x y))

; a
; infinite loop

; c
(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (apply proc (map contents args))
                (if (= (length args) 2)
                    (let ((type1 (car type-tags))
                          (type2 (cadr type-tags))
                          (a1 (car args))
                          (a2 (cadr args)))
                        (if (eq? type1 type2)
                            (error "No method for these types" (list op type-tags))
                            (let ((t1->t2 (get-coersion type1 type2))
                                  (t2->t2 (get-coersion type2 type1)))
                                (cond (t1->t2 (apply-generic op (t1->t2 a1) a2))
                                      (t1->t2 (apply-generic op a1 (t2->t1 a2)))
                                      (else (error "No method for these types" (list op type-tags)))))))
                    (error "No method for these types" (list op type-tags)))))))
