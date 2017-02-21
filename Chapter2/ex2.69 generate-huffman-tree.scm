; Exercise 2.69
(define (generate-huffman-tree pairs)
    (successive-merge (make-leaf-set pairs)))

(define (successive-merge leave-pairs)
    (let ((first (car leave-pairs))
          (second (cadr leave-pairs))
          (rest (cddr leave-pairs))
        )
        (if (null? rest)
            (make-code-tree first second)
            (successive-merge (cons (make-code-tree first second) rest))
            ))
)

(define pair '((a 4) (b 2) (d 1) (c 1)))

(generate-huffman-tree pair)

