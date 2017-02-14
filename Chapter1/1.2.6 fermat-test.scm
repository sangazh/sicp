; 1.2.6 The Fermat test 费马小定理

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even?) exp)
           (remainder (square (expmod base (/ exp 2) m))
                      m))
          (else (remainder (* base (expmod base (- exp 1) m))
                           m)))

(define (fermat-test n)
    (define (try-it a)
      (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-expt? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-expt? n (- times 1)))
          (else false)))
