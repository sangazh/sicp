; Exercise 3.37
(define (celsius-fahrenheit-converter1 x)
    (c+ (c* (c/ (cv 9) (cv 5))
            x)
        (cv 32)))
(define C (make-connector))
(define F (celsius-fahrenheit-converter1 C))

(define (c+ x y)
    (let ((z (make-connector)))
        (adder x y z)
        z))

(define (c- x y)
    (let ((z (make-connector)))
        (adder y z x)
        z))

(define (c* x y)
    (let ((z (make-connector)))
        (mutiplier x y z)
        z))

(define (c/ x y)
    (let ((z (make-connector)))
        (mutiplier y z x)
        z))

(define (cv x)
    (let ((z (make-connector)))
        (constant x z)
        z))