; recursive
(define (f n)
    (cond ((< n 3) n)
      (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))  ))
        ))

;iterative
(define (f n)
  (define (f-iter n-1 n-2 n-3 count) ;n-1 equals last-result
    (if (= count 0)
        n-1
        (f-iter (+ (* 3 n-3) (* 2 n-2) n-1) n-1 n-2 (- count 1)))
  )
  (if (< n 3) n
    (f-iter 2 1 0 (- n 2))
  )
)
