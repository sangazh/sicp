;1.3.4 Newton's method 导数

(define (deriv g)
    (lambda (x)
        (/ (- (g (+ x dx)) (g x))
            dx)))
(define dx 0.00001)

((deriv cube) 5)
;Value: 75.00014999664018

(define (newton-transform g)
   (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
    (fixed-point (newton-transform g) guess))


(define (sqrt x)
    (newton-method (lambda (y) (- (square y) x))
                    1.0))


