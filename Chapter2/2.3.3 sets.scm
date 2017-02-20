; 2.3.3 Example: Representing Sets
; union-set
; intersection-set
; element-of-set?
; adjoin-set

; Sets as unordered lists
(define (element-of-set? x set)
    (cond ((null? set) false)
          ((equal? x (car set)) true)
          (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
    (if (element-of-set? x set)
        set
        (cons x set)))

(define (intersection-set set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
          ((element-of-set? (car set1) set2)
            (cons (car set)
                  (intersection-set (cdr set1) set2)
            ))
          (else (intersection-set (cdr set1) set2))))

