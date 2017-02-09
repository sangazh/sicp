; Exercise 2.41

(define (unique-triples n)
    (flatmap (lambda (i)
                (flatmap (lambda (j)
                            (map (lambda (k) (list i j k))
                                 (enumerate-interval 1 (- j 1))))
                         (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n)
))

(define (make-triple-sum triple)
    (append triple (list (accumulate + 0 triple))))

(define (order-triple-sum n s)
    (define (triple-sum? triple sum)
        (= sum (accumulate + 0 triple)))
    (accumulate cons
                nil
                (map make-triple-sum (filter (lambda (triple) (triple-sum? triple s))
                                                (unique-triples n)) )
    ))

(order-triple-sum 5 10)