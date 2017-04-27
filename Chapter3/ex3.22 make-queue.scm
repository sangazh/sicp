; Exercise 3.22
(define (make-queue)
    (let ((front-ptr '())
    	  (rear-ptr '()))
    	; helper
    	(define (set-front-ptr! item) (set! front-ptr item))
    	(define (set-rear-ptr! item) (set! rear-ptr item))

    	(define (empty-queue?) (null? front-ptr))

    	(define (front-queue)
    	  (if (empty-queue?)
    	      (error "FRONT called with an empty queue")
    	      (car front-ptr)))

    	(define (insert-queue! item)
    	  (let ((new-pair (cons item '())))
    	  	(cond ((empty-queue?)
    	  			(set-front-ptr! new-pair)
    	  			(set-rear-ptr! new-pair))
    	  	      (else
    	  	      	(set-cdr! rear-ptr new-pair)
    	  	      	(set-rear-ptr! new-pair)))
    	  	front-ptr))

    	(define (delete-queue!)
    	  (cond ((empty-queue?)
    	  			(error "DELETE! called with empty queue"))
    	        (else
    	        	(set-front-ptr! (cdr front-ptr))))
    	  front-ptr
    	)
    	(define (dispatch m)
    		(cond ((eq? m 'empty-queue?) (empty-queue?))
    			  ((eq? m 'front-queue) (front-queue))
    			  ((eq? m 'insert-queue!) insert-queue!)
    			  ((eq? m 'delete-queue!) (delete-queue!))
    			  ((eq? m 'print-queue) front-ptr)
    		      )
		)
    	dispatch
    ))

(define q (make-queue))
(q 'empty-queue?)
((q 'insert-queue!) 'a)
((q 'insert-queue!) 'b)
(q 'front-queue)
((q 'insert-queue!) 'c)
(q 'empty-queue?)
(q 'delete-queue!)
(q 'print-queue)