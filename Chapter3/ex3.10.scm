; Exercise 3.10
; let version of make-withdraw
(define (make-withdraw initial-amount)
    (let ((balance initial-amount))
    	(lambda (amount)
			(if (>= balance amount)
			    (begin (set! balance (- balance amount))
		    	     balance)
			    "Insufficient funds"))))