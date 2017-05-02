; Exercise 3.3
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
             balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
  balance)

  (define (correct-password? psw)
    (eq? psw password))

  (define (authenticate psw m)
     (if (correct-password? psw)
        (dispatch m)
        (error "Incorrect password")))

  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown requrest -- make-account" m))))
  authenticate
)

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)