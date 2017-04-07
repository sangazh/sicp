; Exercise 3.5
(define (monte-carlo trials experiment)
    (define (iter trials-remaining trials-passed)
      (cond ((= trials-remaining 0) (/ trials-passed trials))
            ((experiment) (iter (- trials-remaining 1) (+ trials-passed 1)))
            (else (iter (- trials-remaining 1) trials-passed))))
	(iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
  	(+ low (random range))))

(define (P x y)
	(< (+ (expt (- x 5) 2)
		   (expt (- y 7) 2))
		(expt 3 2)
	))

(define (estimate-integral P x1 x2 y1 y2 trials)
	(define (experiment)
	  (P (random-in-range x1 x2)
	  	 (random-in-range y1 y2)))
	(monte-carlo trials experiment))

(estimate-integral P 2.0 8.0 4.0 10.0 10000)

(define pi-approx
    (/ (* (estimate-integral P 2.0 8.0 4.0 10.0 100000) 36)
    	9.0))

pi-approx