; Exercise 2.27
(define x (list (list 1 2) (list 3 4)))

(reverse x) ; need ex2.18

(define (deep-reverse items)
	(cond ((null? items) nil)
		  ((pair? (car items)) (append (deep-reverse (cdr items)) (list (deep-reverse (car items))) ))
		  (else (append (deep-reverse (cdr items)) (list (car items)))
		  )
	)
)

(deep-reverse x)
