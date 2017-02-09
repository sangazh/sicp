; Exercise 2.21

(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items))
            (square-list (cdr items))
      )))

(define (square-list items)
    (map (lambda (x) (* x x)) items))

(square-list (list 1 3 4 5))