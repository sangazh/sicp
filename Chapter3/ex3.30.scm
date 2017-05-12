; Exercise 3.30

(define (ripple-carry-adder Ak Bk Sk C)
    (define (iter A B S c-in c-out)
        (if (null? A)
            S
            alternative)
            (begin
                (full-adder (car A) (car B) c-in (car S) c-out)
                (iter (cdr A) (cdr B) (cdr S) c-out (make-wire))))
    (iter Ak Bk Sk (make-wire) C))

; a half-adder-delay =  or-gate-delay + 2 * and-gate-delay + inverter-delay
; a full-adder-delay = 2* half-adder-delay + or-gate-delay
;                    = 3 * or-gate-delay + 4 * and-gate-delay + 2 * inverter-delay
; n bits => n hfull-adder-delay