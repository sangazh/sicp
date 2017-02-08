; Exercise 2.33
(define (map p sequence)
    (accumulate (lambda (x y)
    					(cons (p x) y)
    			)
    			nil
    			sequence))

(map abs (list -10 3.5 -11.6 17))
(map (lambda (x) (* x x))
	 (list 1 2 3 4))

(define (append seq1 seq2)
    (accumulate cons seq2 seq1 ))

(append (list 2 4) (list 3 6))

(define (length sequence)
    (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(length (list 1 3 5 7 9))
