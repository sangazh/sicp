; Exercise 2.12
(define (make-center-width c w)
	(make-interval (- c w) (+ c w)))
(define (center i)
	(/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
	(/ (- (upper-bound i) (lower-bound i)) 2))

; first solution
(define (make-center-percent c p)
	(make-interval (* c (- 1 (/ p 100.0))) (* c (+ 1 (/ p 100.0))) ))

(define (percent i)
	(* 100.0 (- 1 (/ (lower-bound i) (center i)))))

; second solution, using make-center-width
(define (make-center-percent c p)
	(make-center-width c (* c (/ p 100.0))))

(define (percent i)
	(* 100 (/ (width i) (center i)))
)

(define cp (make-center-percent 3.5 15))

(percent cp)
(center cp)