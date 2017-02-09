; Exercise 2.38

; namely accumulate
(define (fold-right op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))
    ))

(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest))
                  (cdr rest))))
    (iter initial sequence)
)

(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(fold-right list nil (list 1 2 3))
(fold-left list nil (list 1 2 3))

(fold-right cons nil (list 1 2 3 4 5))
(fold-left cons nil (list 1 2 3 4 5))

; +, *, and, or will produce the same values
(fold-right + 0 (list 1 2 3 4 5))
(fold-left + 0 (list 1 2 3 4 5))
(fold-right * 1 (list 1 2 3 4 5))
(fold-left * 1 (list 1 2 3 4 5))