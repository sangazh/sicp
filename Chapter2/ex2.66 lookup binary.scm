; Exercise 2.66
(define (lookup given-key set-of-records)
    (if (null? set-of-records)
        false
        (let ((cur-key (entry set-of-records)))
            (cond ((equal? given-key cur-key) true)
                  ((< given-key cur-key) (lookup given-key (left-branch set-of-records)))
                  ((> given-key cur-key) (lookup given-key (right-branch set-of-records)))))))