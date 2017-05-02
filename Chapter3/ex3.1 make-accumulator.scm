; Exercise 3.1

(define (make-accumulator init)
    (lambda (number)
        (begin (set! init (+ number init))
            init
        ))
  )

(define A (make-accumulator 5))
(A 10)
(A 10)