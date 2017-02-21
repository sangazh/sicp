; Exercise 2.64
(define (list->tree elements)
    (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
    (if (= n 0)
        (cons '() elts)
        (let ((left-size (quotient (- n 1) 2)))
            (let ((left-result (partial-tree elts left-size)))
                (let ((left-tree (car left-result))
                      (non-left-elts (cdr left-result))
                      (right-size (- n (+ left-size 1))))
                    (let ((this-entry (car non-left-elts))
                          (right-result (partial-tree (cdr non-left-elts) right-size)))
                        (let ((right-tree (car right-result))
                              (remaining-elts (cdr right-result)))
                            (cons (make-tree this-entry left-tree right-tree)
                                  remaining-elts))))))))

(list->tree '(1 3 5 7 9 11))
; a.
;
; 1. left-size = (6-1) /2 = 2
; 2. left-result is a recursive partial-tree with left size(2)
; 3. right-size = (6 - (2 + 1）) = 3. the remaining 1 is for the middle(top) of the tree
; 4. left-tree is car of left-result, and non-left-elts id cdr of left-result, which of
;    car will be the entry of the this tree, then cdr of it would form to the right-tree.
; 5. make-tree
;
; (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
; tree is like this:
;          5
;       /     \
;      1       9
;       \     / \
;        3   7   11

; b. O(n)
