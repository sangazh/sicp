; Exercise 3.6
(define rand
    (let ((x random-init))
        (define (dispatch m)
            (cond ((eq? m 'generate)
                    (begin (set! x (rand-update x))
                            x))
                  ((eq? m 'reset)
                    (lambda (new-value) (set! x new-value)))))
        dispatch))

(define random-init 0)
(define (rand-update x) (+ x 1))

(rand 'generate)
((rand 'reset) 10)
