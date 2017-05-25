; Exercise 3.50

; see subsets mentioned in Exercise 2.32
; and footnote 12
(map + (list 1 2 3) (list 40 50 60) (list 700 800 900))
(map (lambda (x y) (+ x (* 2 y)))
     (list 1 2 3)
     (list 4 5 6))

(define (stream-map proc . argstreams)
    (if (stream-null? (car argstreams))
        the-empty-stream
        (cons-stream
            (apply proc (map stream-car argstreams))
            (apply stream-map
                   (cons proc (map stream-cdr argstreams))))))