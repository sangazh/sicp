; Exercise 2.14

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
  				(add-interval r1 r2)))
(define (par2 r1 r2)
	(let ((one (make-interval 1 1)))
		(div-interval one
					  (add-interval (div-interval one r1)
		 							(div-interval one r2)))))

(define a (make-center-percent 10 5))
(define b (make-center-percent 8 2))

(par1 a b)
(par2 a b)

(par1 a a)
(par2 a a)