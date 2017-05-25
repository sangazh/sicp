; 3.5.2 Infinite Streams
(define (integers-starting-from n)
    (cons-stream n (integers-starting-from (+ n 1))))
(define integers (integers-starting-from 1))
(define (divisible? x y) (= (remainder x y) 0))
(define no-sevens
    (stream-filter (lambda (x) (not (divisible? x y)))
                   integers))
(stream-ref no-sevens 100)
; as intergers is causing an error:
;Aborting!: maximum recursion depth exceeded
; so not defined successfully, then (stream-ref no-sevens 100) cannot run.

(define (fibgen a b)
    (cons-stream a (fibgen b (+ a b))))
(define fibs (fibgen 0 1))

(define (sieve stream)
    (cons-stream
        (stream-car steam)
        (sieve (stream-filter
                (lambda (x)
                    (not (divisible? x (stream-car stream))))
                (stream-cdr stream)))))

(define primes (sieve (intergers-starting-from 2)))
(stream-ref primes 50)

;; Defining streams implicitly
(define ones (cons-stream 1 ones))

(define (add-streams s1 s2)
    (stream-map + s1 s2))

(define intergers (cons-stream 1 (add-streams ones intergers)))

(define fibs
    (cons-stream 0
                 (cons-stream 1
                              (add-streams  (stream-cdr fibs)
                                           fibs))))

(define (scale-stream stream factor)
    (stream-map (lambda (x) (* x factor)) stream))

(define double (cons-stream 1 (scale-stream double 2)))

(define primes
    (cons-stream
        2
        (stream-filter prime? (intergers-starting-from 3))))

(define (prime? n)
    (define (iter ps)
        (cond ((> (square (stream-car ps)) n) true)
              ((divisible? n (stream-car ps)) false)
              (else (iter (stream-cdr ps)))))
    (iter primes))