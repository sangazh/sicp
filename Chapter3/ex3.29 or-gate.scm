; Exercise 3.29
(define (or-gate a1 a2 output)
    (let ((b (make-wire))
          (d (make-wire))
          (e (make-wire)))
        (inverter a1 b)
        (inverter a2 d)
        (and-gate b d e)
        (inverter e output)
    'ok))

; and-gate-delay + inverter-delay * 2

