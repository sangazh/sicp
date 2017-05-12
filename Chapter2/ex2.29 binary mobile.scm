; Exercise 2.29

; left/right reperesent a branch
(define (make-mobile left right) (list left right))

; structure may be either a number(weight) or another mobile
(define (make-branch length structure) (list length structure))

; a
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))

; b
(define (branch-weight branch)
    (cond ((pair? (branch-structure branch)) (total-weight (branch-structure branch)))
             (else (branch-structure branch)))
)

(define (total-weight mobile)
    (+ (branch-weight (left-branch mobile))
        (branch-weight (right-branch mobile))
    ))

; test
(define br-sub-r-l (make-branch 5 3))
(define br-sub-r-r (make-branch 3 5))
(define sub-r-mo (make-mobile br-sub-r-l br-sub-r-r))
(define br-right (make-branch 6 sub-r-mo))
(define br-left (make-branch 5 10))
(define top-mobile (make-mobile br-left br-right))

(total-weight top-mobile)

; c
(define (branch-torque branch)
    (* (branch-length branch) (branch-weight branch) ) )

(define (balanced? mobile)
    (= (branch-torque (left-branch mobile)) (branch-torque (right-branch mobile)))
)

(balanced? top-mobile)
;#f
(balanced? sub-r-mo)
;#t

; d
(define (make-mobile left right) (cons left right))
(define (make-branch length structure) (cons length structure))

; only need modify right-branch and branch-structure as follows:
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cdr mobile))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (cdr branch))
