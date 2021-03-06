; 2.1.1 Example: Arithmetic Operations for Rational Numbers

; Pairs
(define (make-rat n d)
	(let ((g (gcd n d)))
		(cons (/ n g) (/ d g))
	))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
	(make-rat (+ (* (numer x) (denom y))
				 (* (numer y) (denom x)))
			  (* (denom x) (denom y))))

(define (sub-rat x y)
	(make-rat (- (* (numer x) (denom y))
			     (* (numer y) (denom x)))
		      (* (denom x) (denom y))))

(define (mul-rat x y)
	(make-rat (* (numer x) (numer y))
		      (* (denom x) (denom y))))

(define (div-rat x y)
	(make-rat (* (numer x) (denom y))
	          (* (denom x) (numer y))))

(define (equal-rat? x y)
	(= (* (numer x) (denom y))
	   (* (numer y) (denom x))
	))

; Representing rational numbers

(define (print-rat x)
	(newline)
	(display (numer x))
	(display "/")
	(display (denom x)))

(define one-half (make-rat 1 2))
(print-rat one-half)

(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))
(print-rat (sub-rat one-half one-third))
(print-rat (mul-rat one-half one-third))
(print-rat (div-rat one-half one-third))
(print-rat (add-rat one-third one-third))


; 2.1.2 Abstraction Barriers

; preferable when not access numerators and denominators a lot.
(define (make-rat n d) (cons n d))

(define (numer x)
	(let ((g (gcd n d)))
		(/ (car x) g)))

(define (denom x)
	(let ((g (gcd n d)))
		(/ (cdr x) g)))
