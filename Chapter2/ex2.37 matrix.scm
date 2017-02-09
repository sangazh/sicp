; Exercise 2.37
; depends on 2.36

(define (dot-product v w)
    (accumulate + 0 (map * v w) ))

(define m (list (list 1 2 3 4)
                (list 4 5 6 6)
                (list 6 7 8 9)
))

(dot-product (list 1 2 3 4) (list 4 5 6 6))

(define (matrix-*-vector m v)
    (map (lambda (row) (dot-product row v)) m)
)

(matrix-*-vector m (list 1 2 3 4))

; ref: https://en.wikipedia.org/wiki/Transpose
(define (transpose mat)
    (accumulate-n cons nil mat))

(transpose m)

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (row) (matrix-*-vector cols row))
             m)))

(define m1 (list (list 1 2 3 4)
                (list 4 5 6 6)
                (list 6 7 8 9)
))

(define m2 (list (list 2 3 5)
                (list 5 6 5)
                (list 7 8 5)
))

(matrix-*-matrix m1 m2)