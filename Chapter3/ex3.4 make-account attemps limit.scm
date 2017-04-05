; Exercise 3.4
(define (make-account balance password)
  (define attemps 0)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
      	     balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
	balance)

  (define (call-the-cops) (display "The Cops have been called!" ) true)

  (define (correct-password? psw)
  	(if (eq? psw password)
  	    (begin (set! attemps 0)
  	    	   true)
  	    (begin (set! attemps (+ 1 attemps))
  	    	   (error "Incorrect password"))))

  (define (check-password psw m)
  	(if (> attemps 7)
  	    (call-the-cops)
  	    (if (correct-password? psw)
      	    (dispatch m)
      	    (error "Incorrect password"))))

  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown requrest -- make-account" m))))
  check-password
)


(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)