; Exercise 2.13
; assume all number are positive, then
; a [x1, x2], b [y1, y2]
; a * b = [x1y1, x2y2]

; x1 = cx(1 - px/100)
; x2 = cx(1 + px/100)
; y1 = cy(1 - py/100)
; y2 = cy(1 + py/100)

; x1y1 = cx(1 - px/100) * cy(1 - py/100)
;      = cxcy (1 - (px+py) / 100 + pxpy/10000)
; x2yx = cx(1 + px/100) * cy(1 + py/100)
;      = cxcy (1 + (px+py) / 100 + pxpy/10000)

; if prcentage tolerances of a and b are so small that pxpy/10000 can be ignored,
; then the formula of a * b can be simplified as
; center of a * b is (cx * cy)
; percent of a * b is (px + py)

(define a (make-center-percent 10 5))
(define b (make-center-percent 8 2))
(define c (mul-interval a b))

(center c)
(percent)