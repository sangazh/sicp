; Exercise 3.21

(define (print-queue queue)
    (car queue))

; then, remodify insert-queue! and delete-queue!
(define (insert-queue! queue item)
    (let ((new-pair (cons item '())))
    	(cond ((empty-queue? queue)
    		   (set-front-ptr! queue new-pair)
    		   (set-rear-ptr! queue new-pair)
    		   (print-queue queue))
    	      (else (set-cdr! (rear-ptr queue) new-pair)
    	      		(set-rear-ptr! queue new-pair)
    	      		(print-queue queue)))))

(define (delete-queue! queue)
    (cond ((empty-queue? queue) (error "DELETE! called with empty queue" queue))
          (else (set-front-ptr! queue (cdr (front-ptr queue)))
          		(print-queue queue))))