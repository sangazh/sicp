; Exercise 2.58
; a.
(define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
         ((=number? a2 0) a1)
         ((and (number? a1) (number? a2)) (+ a1 a2))
         (else (list a1 '+ a2))))

(define (sum? x)
    (and (pair? x) (eq? (cadr x) '+)))
(define (addend s) (car s))
(define (augend s) (caddr s))

; test
(make-sum 'a 'b)
(addend '(a + b))
(augend '(a + b))
(sum? '(a + b))
(sum? '(a - b))

(define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list m1 '* m2))))
(define (multiplier p) (car p))
(define (multiplicand p) (caddr p))

(define (product? x)
    (and (pair? x) (eq? (cadr x) '*)))

(make-sum 'x (make-product 3 (make-sum 'x (make-sum 'y 2))))

; b.
(define (sum? x)
  (cond ((not (pair? x)) false)
        ((memq '+ x) true)
        (else false)))

(define (addend s)
  (if (eq? '* (cadr s))
      (list (car s) '* (addend (cddr s)))
      (car s)))

(define (augend s)
  (let ((sec-list (cdr (memq '+ s))))
      (if (pair? (cdr sec-list))
          sec-list
          (car sec-list)))
  )

; test
(sum? '(a * 3 + 3))
(sum? '(a * b * 3))

(addend '(a + b + c))
(addend '(a * b + c))
(addend '(a * b * c + c))

(augend '(a + b + c))
(augend '(a + b * c))
(augend '(a * b + c))
(augend '(a * b * c + c))

;
(define (product? x)
  (cond ((not (pair? x)) false)
        ((memq '+ x) false)
        ((memq '* x) true)
        (else false)))

; selectors remains the same
(define (multiplier p) (car p))
(define (multiplicand p) (caddr p))

(deriv '(x + 3 * (x + y + 2)) 'x)
(deriv '(x + 3 * (x + y + 2)) 'y)
(deriv '(x * 3 + 5 * (x + y + 2)) 'x)
