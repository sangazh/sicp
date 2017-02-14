; Exercise 1.20

; Euclid's Algorithm 计算最大公约数
(define (gcd a b)
    (if (= b 0)
         a
         (gcd b (remainder a b))) )

; normal order
(gcd 206 40)
(gcd 20 (remainder 206 20))
;(gcd 20 6)
(gcd (remainder 206 20) (remainder 20 (remainder 206 20)))
;(gcd 6 (remainder 20 6))
;(gcd 6 2)
(gcd (remainder 20 (remainder 206 20)) (remainder (remainder 206 20) (remainder 20 (remainder 206 20))))
;(gcd 2 0)
2

; Normal Order 6 times.

; applicative-order
(gcd 206 40)
(gcd 20 (remainder 206 20))
(gcd 20 6)
(gcd 6 (remainder 20 6))
(gcd 6 2)
(gcd 2 (remainder 6 2))
(gcd 2 0)
2

; Application Order 3 times