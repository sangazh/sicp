; Exercise 3.53
(define s (cons-stream 1 (add-streams s s)))
; 1 2 4 8 16 32 64