; Exercise 2.60
; allow duplicates
(define (adjoin-set x set)
    (cons x set))

(define (union-set set1 set2)
    (append set1 set2))

(union-set '(2 3 4) '(1 2 34))

; efficiency
; efficiencied of element-of-set? and intersection-set will not change.
; adjoin-set n times -> 1
; union-set n^2(set1) times -> n

; faster but requires more memory to store the lists.