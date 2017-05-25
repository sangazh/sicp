; 3.5 Streams
;; Streams Are Delayed Lists

; cons-stream
; stream-car
; stream-cdr
; the-empty-stream
; stream-null
(define the-empty-stream '())
(define (stream-null? s )
    (eq? the-empty-stream s))

(define (stream-ref s n)
    (if (= n 0)
        (stream-car s)
        (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
    (if (stream-null? s)
        the-empty-stream
        (cons-stream (proc (stream-car s))
                     (stream-map proc (stream-cdr s)))))

(define (stream-for-each proc s)
    (if (stream-null? s)
        'done
        (begin (proc (stream-car s))
               (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
    (stream-for-each display-line s))
(define (display-line x)
    (newline)
    (display x))

; delay
; force

(define (cons-stream a b)
    (cons a (delay b)))
(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))

;; The stream implementaion in action
(stream-car
    (stream-cdr
        (stream-filter prime?
                       (stream-enumerate-interval 10000 1000000))))

(define (stream-enumerate-interval low high)
    (if (> low high)
        the-empty-stream
        (cons-stream low
                     (stream-enumerate-interval (+ low 1) high))))

(define (stream-filter pred stream)
    (cond ((stream-null? stream) the-empty-stream)
          ((pred (stream-car stream))
           (cons-stream (stream-car stream)
                        (stream-filter pred
                                       (stream-cdr stream))))
          (else (stream-filter pred (stream-cdr stream)))))

;; Implementing delay and force
(define (force delayed-object)
    (delayed-object))

(define (delay proc)
    (lambda () proc))

(define (memo-proc proc)
    (let ((already-run? false) (result false))
        (lambda ()
            (if (not already-run?)
                (begin (set! result (proc))
                       (set! already-run? true))
                result))))

;(define (delay proc)
;  (memo-proc (lambda () (proc))))