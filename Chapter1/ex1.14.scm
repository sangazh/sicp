; Exercise 1.14
; amount = 11
; kinds-of-coins = 5
; (+ (cc amount (- kinds-of-coins 1)) (cc (- amount (first-demonination kinds-of-coins)) kinds-of-coins))
(count-change 11)
(cc 11 5) ;amount kinds-of-coins
(+ (cc 11 (- 5 1)) (cc (- 11 (first-demonination 5)) 5))
(+ (cc 11 4) (cc (- 11 50) 5))
(+ (cc 11 4) (cc 39 5))
(+ (+ (cc 11 (- 4 1)) (cc (- 11 (first-demonination 4)) 4))
	(+ (cc 39 (- 5 1)) (cc (- 39 (first-demonination 5)) 5)) )
(+ (+ (cc 11 3) (cc (- 11 25) 4))
	(+ (cc 39 4) (cc (- 39 50) 5)) )
(+ (+ (cc 11 3) (cc 14 4))
	(+ (cc 39 4) (cc 11 5)) )

; 怎么看都是指数倍啊