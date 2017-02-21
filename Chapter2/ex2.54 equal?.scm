; Exercise 2.54
; equal? is a primitive procedure
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))

; exercise
(define (equal1? list1 list2)
    (cond ((and (null? list1) (null? list2)) true)
          ((or (null? list1) (null? list2)) false)
          ((eq? (car list1) (car list2))
            (equal1? (cdr list1) (cdr list2)))
          (else false)))

(equal1? '(this is a list) '(this is a list))
(equal1? '(this is a list) '(this (is a) list))

; test
(equal? '() '())

(equal? '() 'a)

(equal? '((x1 x2) (y1 y2)) '((x1 x2) (y1 y2)))

(equal? '((x1 x2) (y1 y2)) '((x1 x2 x3) (y1 y2)))

(equal? '(x1 x2) 'y1)

(equal? 'abc 'abc)

(equal? 123 123)