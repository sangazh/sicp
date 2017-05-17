; Exercise 3.33
; (a + b) = d
; 2 * c = d
; 2 = e
(define (averager a b c)
        (let ((d (make-connector))
              (e (make-connector)))
            (adder a b d)
            (mutiplier c e d)
            (constant 2 e)
            'ok))
