; Exercise 2.40

(define (unique-pairs n)
    (flatmap (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))
               ))
              (enumerate-interval 1 n))
)

(unique-pairs 3)

(define (prime-sum-pairs n)
    (map make-pair-sum
        (filter prime-sum?
                (unique-pairs n)
        )
    ))

(prime-sum-pairs 6)