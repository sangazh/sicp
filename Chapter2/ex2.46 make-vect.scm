; Exercise 2.46
; depends by 2.2.4 Frames
(define (make-vect x y) (cons x y) )
(define (xcor-vect vect) (car vect))
(define (ycor-vect vect) (cdr vect))

(define (add-vect vect1 vect2)
    (make-vect (+ (xcor-vect vect1) (xcor-vect vect2))
               (+ (ycor-vect vect1) (ycor-vect vect2))))

(define (sub-vect vect1 vect2)
    (make-vect (- (xcor-vect vect1) (xcor-vect vect2))
               (- (ycor-vect vect1) (ycor-vect vect2))))

(define (scale-vect vect factor)
    (make-vect (* (xcor-vect vect) factor)
               (* (ycor-vect vect) factor)))