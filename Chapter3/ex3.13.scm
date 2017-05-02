; Exercise 3.13
(define (make-cycle x)
    (set-cdr! (last-pair x) x)
    x)

(define z (make-cycle (list 'a 'b 'c)))

(last-pair z)

; z is a circle. and calling last-pair of z is infinite.
;
; ,------------------、
; |                  |
; v                  |
;[·][·]->[·][·]->[·][·]
; |       |       |
; v       v       v
; a       b       c