; Exercise 2.19
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
	(cond ((= amount 0) 1)
	       ((or (< amount 0) (no-more? coin-values)) 0)
		   (else (+ (cc amount
	    			(except-first-denomination coin-values))
					(cc (- amount
					       (first-demonination coin-values))
					 	coin-values)) )))


(define (first-demonination items)
	(car items))

(define (except-first-denomination items)
    (cdr items))

(define (no-more? items)
	(null? items))

(cc 100 us-coins)
;Value: 292

(cc 100 uk-coins)
;Value: 104561


; Dose order of the list coin-values affect the answer?
(define r-us-coins (reverse us-coins))
(cc 100 us-coins)
(cc 100 r-us-coins)

; both results are 292. so no, not affect

; No.