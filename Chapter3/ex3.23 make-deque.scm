; Exercise 3.23

(define (make-element item) (list item '() '()))
(define (previous-element e)
        (if (null? (cadr e))
            false
            (cadr e)))
(define (next-element e)
        (if (null? (caddr e))
            false
            (caddr e)))
(define (set-previous! e new-point)
        (set-car! (cdr e) new-point))
(define (set-next! e new-point)
        (set-car! (cddr e) new-point))

;; test
;(define a  (make-element 'a))
;(define b  (make-element 'b))
;(define c  (make-element 'c))

;(set-next! a b)
;;(set-previous! a c)
;;e
;(set-next! b c)
;;(set-previous! e 'e)
;a

;(define (print-element e)
;    (if (eq? false e)
;        '()
;        (cons (car e) (print-element (next-element e)) )
;    ))
;(print-element a)

(define (make-deque)
    (let ((front-ptr '())
    	  (rear-ptr '()))

	    ; helper
	    (define (set-front-ptr! item) (set! front-ptr item))
	    (define (set-rear-ptr! item) (set! rear-ptr item))

    	(define (empty-deque?) (null? front-ptr))

		;selectors
    	(define (front-deque)
    	  (if (empty-deque?)
    	      (error "FRONT called with an empty queue")
    	      (car front-ptr)))

    	(define (rear-deque)
    	  (if (empty-deque?)
    	      (error "REAR called with an empty queue")
    	      (car rear-ptr)))

    	; mutators
    	(define (rear-insert-deque! item)
    		(let ((new-pair (make-element item)))
    			(cond ((empty-deque?)
    					(set-front-ptr! new-pair)
    					(set-rear-ptr! new-pair))
    			      (else
               			(set-next! rear-ptr new-pair)
               			(set-previous! new-pair rear-ptr)
    			      	(set-rear-ptr! new-pair)

              ;    		(set-next! (previous-element rear-ptr) new-pair)
                    ))
    			(print-deque)))

    	(define (front-insert-deque! item)
    		(let ((new-pair (make-element item)))
    			(cond ((empty-deque?)
    					(set-front-ptr! new-pair)
    					(set-rear-ptr! new-pair))
    			      (else
    			      	(set-next! new-pair front-ptr)
    			      	(set-front-ptr! new-pair)
    			      	(set-previous! (next-element front-ptr) new-pair)
              ))
    		(print-deque)))

    	(define (front-delete-deque!)
    	  (cond ((empty-deque?)
    	  			(error "DELETE! called with empty queue"))
    	        (else
    	        	;(set-front-ptr! (cdr front-ptr))))
       				(set-front-ptr! (next-element front-ptr))
           			(set-previous! front-ptr '())))
    	  (print-deque))

    	; cannot implement to O(1), need to add a new pointer
    	(define (rear-delete-deque!)
    	  (cond ((empty-deque?)
    	  			(error "DELETE! called with empty queue"))
    	        (else
               		(set-rear-ptr! (previous-element rear-ptr))
               		(set-next! rear-ptr '())))
    	  (print-deque)
    	)

      	(define (print-deque)
            (define (print-element e)
                (if (eq? false e)
                    '()
                    (cons (car e) (print-element (next-element e)))))
            (print-element front-ptr)
        )

    	(define (dispatch m)
    		(cond ((eq? m 'empty-deque?) (empty-deque?))
    			  ((eq? m 'front-deque) (front-deque))
    			  ((eq? m 'rear-deque) (rear-deque))
    			  ((eq? m 'front-insert-deque!) front-insert-deque!)
    			  ((eq? m 'rear-insert-deque!) rear-insert-deque!)
    			  ((eq? m 'front-delete-deque!) (front-delete-deque!))
    			  ((eq? m 'rear-delete-deque!) (rear-delete-deque!))
    			  ((eq? m 'print-deque) (print-deque))
    		      ))
    	dispatch))

; test
(define q (make-deque))
(q 'empty-deque?)

((q 'front-insert-deque!) 'a)
(q 'empty-deque?)
((q 'front-insert-deque!) 'b)

((q 'front-insert-deque!) 'c)

((q 'rear-insert-deque!) 'f)
((q 'rear-insert-deque!) 'g)
; (c b a f g)

(q 'front-deque)
(q 'rear-deque)

(q 'front-delete-deque!)
(q 'rear-delete-deque!)

(q 'print-deque)

