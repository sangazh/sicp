; 1 dollar
; 0.5, 0.25, 0.1, 0.05, 0.01

(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
		(else (+ (cc amount
					 (- kinds-of-coins 1))
				 (cc (- amount
				 		(first-demonination kinds-of-coins))
				 	kinds-of-coins)) )))
(define (first-demonination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
	  	((= kinds-of-coins 2) 5)
	  	((= kinds-of-coins 3) 10)
	  	((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)) )
