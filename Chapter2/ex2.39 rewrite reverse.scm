; Exercise 2.39

(define (reverse sequence)
    (fold-right (lambda (x y) (append y (list x)))
                nil
                sequence
    ))

(reverse (list 1 4 9 16 25))

(define (reverse sequence)
    (fold-left (lambda (x y) (cons y x ))
                nil
                sequence
    ))

(reverse (list 1 4 9 16 25))