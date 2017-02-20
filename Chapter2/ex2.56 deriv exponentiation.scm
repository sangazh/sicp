; Exercise 2.56

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
                           (deriv (multiplicand exp) var))
             (make-product (deriv (multiplier exp) var)
                           (multiplicand exp))))
          ; exercise
          ((exponentiation? exp)
            (make-product
                (make-product (exponent exp)
                              (make-exponentiation (base exp)
                                                   (make-sum (exponent exp) -1)))
                (deriv (base exp) var)))
          (else (error "unknow expression type -- DERIV" exp))))

(define (make-exponentiation base exponent)
    (cond ((=number? exponent 0) 1)
          ((=number? exponent 1) base)
          ((and (number? base) (number? exponent)) (expt base exponent))
          (else (list '** base exponent))))

(define (exponentiation? x)
    (and (pair? x) (eq? (car x) '** )))
(define (base e) (cadr e))
(define (exponent e) (caddr e))

(deriv '(** 2 x) 'x)