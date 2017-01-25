; Exercise 2.3
; depends on ex2.2

; approach 1
(define (make-ractangle length width)
	(cons length width))

(define (length ractangle)
	(car ractangle))

(define (width ractangle)
	(cdr ractangle))

; approach 2 in a plane
; p4--------p3
; |         l2
; p1---l1---p2
; p1 = left bottom point, p3 = right top point
(define (make-ractangle p1 p3)
	(cons p1 p3)
)

(define (length ractangle)
	(abs (- (x-point (car ractangle)) (x-point (cdr ractangle))))
)
(define (width ractangle)
	(abs (- (y-point (car ractangle)) (y-point (cdr ractangle))))
)

; or
(define (line1 ractangle)
	(make-segment (car ractangle)
				  (make-point (x-point (cdr ractangle))
				              (y-point (car ractangle))))
)

(define (line2 ractangle)
	(make-segment (cdr ractangle)
		          (make-point (x-point (cdr ractangle))
		          	          (y-point (car ractangle))))
)

(define (length ractangle)
	(abs (- (x-point (start-segment (line1 ractangle)))
		    (x-point (end-segment (line1 ractangle))))))

(define (width ractangle)
	(abs (- (y-point (start-segment (line2 ractangle)))
		    (y-point (end-segment (line2 ractangle))))))

; ---------

(define (perimeter ractangle)
	(* 2 (+ (length ractangle) (width ractangle))))

(define (area ractangle)
	(* (length ractangle) (width ractangle)))

(define p1 (make-point 1 1))
(define p2 (make-point 5 3))

(define rac (make-ractangle p1 p2))
(display (perimeter rac))
(display (area rac))