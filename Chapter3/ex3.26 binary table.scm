; Exercise 3.26
; depends on ; 2.3.3 binary trees
; depends on ; Exercise 2.66 lookup

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
    (list entry left right))

(define (entry-key tree) (car (entry tree)) )
(define (entry-value tree) (cdr (entry tree)) )

(define (make-table same-key? greater? less?)
    (let ((local-table (list '*table*)))
        (define (adjoin-set x set)
            (cond ((null? set) (make-tree x '() '()))
                  ((same-key? (car x) (entry-key set))
                    set)
                  ((less? (car x) (entry-key set))
                    (make-tree (entry set)
                               (adjoin-set x (left-branch set))
                               (right-branch set)))
                  ((greater? (car x) (entry-key set))
                    (make-tree (entry set)
                               (left-branch set)
                               (adjoin-set x (right-branch set))))))

        (define (assoc key records-tree)
            (if (null? records-tree)
                false
                (let ((cur-key (entry-key records-tree)))
                    (cond ((same-key? key cur-key) (entry records-tree))
                          ((less? key cur-key) (assoc key (left-branch records-tree)))
                          ((greater? key cur-key) (assoc key (right-branch records-tree)))
                  ))))

        (define (lookup key)
            (let ((record (assoc key (cdr local-table))))
                (if record
                    (cdr record)
                    false)))

    	(define (insert! key value)
            (let ((record (assoc key (cdr local-table))))
                (if record
                    (set-cdr! record value)
                    (set-cdr! local-table (adjoin-set (cons key value) (cdr local-table)))

                    )
                'ok))

    	(define (dispatch m)
    	    (cond ((eq? m 'lookup-proc) lookup)
               	  ((eq? m 'insert-proc!) insert!)
                  ((eq? m 'print) local-table)
    	          (else (error "Unkonw operation -- TABLE" m))))
     	dispatch))

(define operation-table (make-table = > < ))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))


; test
; x
(put 1  'a)
(get 1)
(put 2 'b)
(put 3 'c)
(put 3 'd)
(get 3  )
(put 2 'e)

(operation-table 'print)
