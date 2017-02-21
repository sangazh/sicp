; Exercise 2.61
; first
(define (adjoin-set x set)
    (cond ((null? set) '())
          ((= x (car set)) set)
          ((< x (car set)) (cons x set))
          ((and (> x (car set)) (null? (cdr set))) (append set (list x)))
          (else (cons (car set) (adjoin-set x (cdr set))))))

; second
(define (adjoin-set x set)
    (cond ((null? set) (cons x '()))
          ((= x (car set)) set)
          ((< x (car set)) (cons x set))
          ((> x (car set)) (cons (car set)
                                 (adjoin-set x (cdr set))))))

; test
(adjoin-set 2 '(2 4 5))
(adjoin-set 2 '(1 2 4 5))
(adjoin-set 2 '(4 5))
(adjoin-set 6 '(4 5))
(adjoin-set 6 '(2 4 5))