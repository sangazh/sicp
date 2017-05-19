; Exercise 3.48

(define (make-account-and-serializer id balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
             balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
  balance)
  (let ((balance-serializer (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'balance) balance)
            ((eq? m 'id) id)
            ((eq? m 'serializer) balance-serializer)
            (else (error "Unknown request -- MAKE-ACCOUNT" m))))
    dispatch))

(define (serialized-exchange account1 account2)
    (let ((serializer1 (account1 'serializer))
          (serializer2 (account2 'serializer))
          (id1 (account1 'id))
          (id2 (account2 'id))
          (serializer1 (if (< id1 id2)
                        (serializer1 (serializer2 exchange))
                        (serializer2 (serializer1 exchange)))))
        (serializer account1 account2)))