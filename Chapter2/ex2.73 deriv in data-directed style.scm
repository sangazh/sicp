; Exercise 2.73
(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp)
            (if (same-variable? exp var) 1 0))
          ((sum? exp)
            (make-sum (deriv (addend exp) var)
                      (deriv (augend exp) var)))
          ((product? exp)
            (make-sum
                (make-product (multiplier exp)
                              (deriv (multiplicand exp)))
                (make-product (deriv (multiplier exp) var)
                              (multiplicand exp))))
          ;;<more rules can be added here>
          (else (error "unkonw expression type -- DERIV" exp))))

; transform to data-directed style

(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp) (if (same-variable? exp var) 1 0))
          (else ((get 'deriv (operator exp)) (operands exp) var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

; ((get 'deriv (operator exp)) (operands exp) var)
; from this line, we can assume a table like this:
;
;       |   sum?  |  product? |  expt
; deriv |         |           |

;b.
(define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))

(define (deriv-product exp var)
    (make-sum
        (make-product (multiplier exp)
                      (deriv (multiplicand exp)))
        (make-product (deriv (multiplier exp) var)
                      (multiplicand exp))))

(define (install-deriv-sum-package)
    (define (sum exp var)
        (make-sum (deriv (addend exp) var)
                  (deriv (augend exp) var)))
    ;(define (tag x) (attach-tag 'sum x))
    (put 'deriv 'sum (lambda (exp var) (sum exp var)))
    'done
)

(define (install-deriv-product-package)
    (define (product exp var)
        (make-sum
            (make-product (multiplier exp)
                          (deriv (multiplicand exp)))
            (make-product (deriv (multiplier exp) var)
                          (multiplicand exp))))
    ;(define (tag x) (attach-tag 'product x))
    (put 'deriv 'product (lambda (exp var) (product exp var)))
    'done
)

;c.
(define (install-deriv-exponentiation-package)
    (define (exponentiation exp var)
        (make-product
            (make-product (exponent exp)
                          (make-exponentiation (base exp)
                                               (make-sum (exponent exp) -1)))
            (deriv (base exp) var)))
    (put 'deriv 'exponentiation (lambda (exp var) (exponentiation exp var)))
    'done
)

;d
((get (operator exp) 'deriv) (operands exp) var)

; the corresponding table will become
;
;         |  deriv
;sum      |
;product  |
;expt     |

; change the order of 'deriv and 'sum would be ok.
(put 'sum 'deriv (lambda (exp var) (sum exp var)))
