; Exercise 3.7
; depends on ex3.3 make-account
(define (make-joint account account-password new-password)
    (define (authenticate psw m)
        (if (number? ((account account-password 'withdraw) 0))
            (check-new-password psw m)
            (error "Incorrect Account password")))

    (define (check-new-password psw m)
        (if (eq? psw new-password)
            (dispatch m)
            (error "Incorrect Joint Acount password")))

    (define (dispatch m)
        (account account-password m)
    )
    authenticate
  )

(define peter-acc (make-account 100 'open-sesame))

(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))

((paul-acc 'rosebud 'withdraw) 10)
((peter-acc 'open-sesame 'withdraw) 20)


; "account account-password new-password" three variable saved inside while defined