; 1.2.5 Greadtest Common Divisors 最大公约数
; Euclid's Algorithm 计算

(define (gcd a b)
    (if (= b 0)
         a
         (gcd b (remainder a b))) )