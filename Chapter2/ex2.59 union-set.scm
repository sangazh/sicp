; Exercise 2.59

(define (union-set set1 set2)
    (cond ((and (null? set1) (null? set2)) '())
          ((null? set1) set2)
          ((null? set2) set1)
          ((element-of-set? (car set1) set2)
            (union-set (cdr set1) set2))
          (else (cons (car set1)
                      (union-set (cdr set1) set2)))))

(union-set '() '())
(union-set '() '(1 2 3 4))
(union-set '(2 3 4) '())
(union-set '(2 3 4) '(1 2 34))

