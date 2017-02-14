(define (sum-iter term a next b) ; a 递增底数 b 上限
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ (term a) result))
        ))
    (iter a 0)
)