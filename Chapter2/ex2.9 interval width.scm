; Exercise 2.9
(define (interval-width x)
	(/ (- (upper-bound x) (lower-bound x)) 2))

(define (interval-width-sum x y)
	(+ (interval-width x) (interval-width y)) )

(define (interval-width-diff x y)
	(+ (interval-width x) (interval-width y)) )

(define sum-of-a-b (add-interval a b))
(define diff-of-a-b (sub-interval a b))

(interval-width-sum a b)
(interval-width sum-of-a-b)

(interval-width-diff a b)
(interval-width diff-of-a-b)

; To verify:

; assume a = [x1, y1], b = [x2, y2]
; c = a + b = [x1 + x2, y1 + y2]
; a(width) = (x1 + y1)/2
; b(width) = (x2 + y2)/2
; c(width) = (x1 + x2 + y1 + y2)/2
; a(width) + b(width) = c(width)

; for substraction of a, b
; assume d = a - b = [x1 - y2, x2 - y1]
; d(width) = (x1 - y2 - (x2 - y1))/2 = (x1 - y2 - x2 + y1)/2
; a(width) - b(width) = (x1 + y1)/2 - (x2 + y2)/2 = (x1 + y1 - x2 - y2)/2

; for mutiple of a, b
; assume e = a * b = [min (x1y1, x1y2, x2y1, x2y2), max(x1y1, x1y2, x2y1, x2y2)]
; e(width) is impossible to be equal to a(width) * b(width)