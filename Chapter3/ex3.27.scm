; Exercise 3.27
(define (fib n)
    (cond ((< n 2) n)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define memo-fib
    (memoize (lambda (n)
                (cond ((= n 0) 0)
                      ((= n 0) 0)
                      (else (+ (memo-fib (- n 1))
                               (memo-fib (- n 2))))))))

(define (memoize f)
    (let ((table (make-table)))
         (lambda (x)
            (let ((previous-computed-result (lookup x table)))
                (or previous-computed-result
                    (let ((result (f x)))
                        (insert! x result table)
                        result))))))

(memo-fib 3)
;Aborting!: maximum recursion depth exceeded

(define memo-fib-1 (memoize fib) )
(memo-fib-1 10)
; 2