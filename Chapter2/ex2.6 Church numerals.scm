;Exercise 2.6

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f)
  		  (lambda (x)
  		  		  (f ((n f) x))
  		  )))

(define one (add-1 zero))
(define two (add-1 one))

; first, try define procedure one, use substitution
(add-1 zero)
(add-1 (lambda (f) (lambda (x) x)))
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x)) ))
; ((lambda (f) (lambda (x) x)) f) => (lambda (f) (lambda (x) x))
(lambda (f) (lambda (x) (f ( (lambda (f) (lambda (x) x) ) x) )))
; ( (lambda (f) (lambda (x) x) ) x) => x
; finally,
(lambda (f) (lambda (x) (f x)))

; Then,
(define one (lambda (f) (lambda (x) (f x))))

; -------
(add-1 one)
(add-1 (lambda (f) (lambda (x) (f x))))
(lambda (f) (lambda (x) (f (( (lambda (f) (lambda (x) (f x))) f) x)) ))
(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x)) ))
(lambda (f) (lambda (x) (f (f x)) ))

(define two (lambda (f) (lambda (x) (f (f x)) )))

((zero inc) 5)
((one inc) 5)
((two inc) 5)
(((church-add one two) inc) 5)

; ------- + ------ ref: https://en.wikipedia.org/wiki/Church_encoding
(define (church-add m n)
	(lambda (f) (lambda (x) ((m f) (( f) x)) ))
)

 (((church-add one two) inc) 5)

 (define three (church-add one two))

 ((three inc) 5)

