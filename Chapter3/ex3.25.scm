; Exercise 3.25
(define (make-table same-key?)
    (let ((local-table (list '*table*)))
        (define (assoc key records)
            (cond ((null? records) false)
                  ((same-key? key (caar records)) (car records))
                  (else (assoc key (cdr records)))
              ))

        (define (lookup key-list)
            (define (lookup-iter keys table)
                (if (null? keys)
                     false
                    (let ((subtable (assoc (car keys) (cdr table))))
                        (if subtable
                            (if (null? (cdr keys))
                                (cdr subtable)
                                (lookup-iter (cdr keys) subtable))
                            false))))
            (lookup-iter key-list local-table))

        (define (insert! value key-list)
            (define (insert-iter keys table)
                (if (null? keys)
                    false
                    (cond ((null? table)
                        (if (null? (cdr keys))
                            (cons (car keys) value)
                            (list (car keys) (insert-iter (cdr keys) '()))))
                      ((null? (cdr keys))
                        (let ((record (assoc (car keys) (cdr table))))
                            (if record
                                (set-cdr! record value)
                                (set-cdr! table
                                          (cons (cons (car keys) value) (cdr table)))))
                      )
                      (else
                        (let ((subtable (assoc (car keys) (cdr table))))
                            (if subtable
                                (insert-iter (cdr keys) subtable)
                                (set-cdr! table
                                          (cons (list (car keys)
                                                      (insert-iter (cdr keys) '()))
                                                (cdr table))))))))
                )
            (insert-iter key-list local-table)
            'ok)
        (define (dispatch m)
            (cond ((eq? m 'lookup-proc) lookup)
                  ((eq? m 'insert-proc!) insert!)
                  ((eq? m 'print) local-table)
                  (else (error "Unkonw operation -- TABLE" m))))
        dispatch))

(define operation-table (make-table eq? ))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))


; test
(put 'seine-river '(paris 1 ))
(get '(paris 1))

(put 'london-eye '(london attraction 1 ))
(get '(london attraction 1 ))

(put 'london-bridge '(london attraction  2 ))
(put 'british-museum '(london museum 2 ))

(get '(london attraction 2 ))
(get '(london museum 2))

(operation-table 'print)

; test
(define x (make-table =))
; x
((x 'insert-proc!) 'a '(1))
; ok
((x 'insert-proc!) 'b '(2) )
; ok
((x 'lookup-proc) '(1))
; a
((x 'lookup-proc) '(2))
; b
((x 'insert-proc!) 'c '(1) )
; ok
((x 'lookup-proc) '(1))
; c
((x 'insert-proc!)  'x '(3 1))
(x 'print)