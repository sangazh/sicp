(define (cube x) (* x x x))

(define (sum-integers a b)
   	(if (> a b)
   	    0
   	    (+ a (sum-integers (+ a 1) b))))

(define (sum-cubes a b)
  	(if (> a b)
  	    0
  	    (+ (cube a) (sum-cubes (+ a 1) b ))))

(define (pi-sum a b)
   (if (> a b)
       0
       (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

; abstracted sum
(define (sum term a next b)
   	(if (> a b)
   	    0
   	    (+ (term a) (sum term (next a) next b))))

; then
(define (identity x) x)
(define (inc n) (+ n 1))
(define (sum-integers a b)
	(sum identity a inc b))

(define (sum-cubes a b)
	(sum cube a inc b))

(define (pi-sum a b)
	(define (pi-term a)
	   (/ 1.0 (* a (+ a 2))))
	(define (pi-next a)
	   (+ a 4))
   	(sum pi-term a pi-next b))

(define (integral f a b dx)
  	(define (add-dx x) (+ x dx))
  	(* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

; lambda

(define (pi-sum a b)
    (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
      a
      (lambda (x) (+ x 4))
      b
    ))

(define (integral f a b dx)
    (* (sum f
            (+ a (/ dx 2.0))
            (lambda (x) (+ x dx))
            b)
        dx))