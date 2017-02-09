; Exercise 2.18
; depends on 2.2.1
(define (reverse items)
    (let ((temp-list (cons (car items) nil)))
        (if (null? (cdr items))
            items
            (append (reverse (cdr items)) temp-list)
            )))

(reverse (list 1 4 9 16 25))