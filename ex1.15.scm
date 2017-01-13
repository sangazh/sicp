; Exercise 1.15
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1 ))
        angle
        (p (sine (/ angle 3.0)))) )

(sine 12.15) ; result is -0.3998
(p (sine (/ 12.15 3.0)))
(p (sine 4.05))
(p (p (sine (/ 4.05 3.0))))
(p (p (sine 1.35)))
(p (p (p (sine (/ 1.35 3.0)))))
(p (p (p (sine 0.45))))
(p (p (p (p (sine (/ 0.45 3.0))))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine (/ 0.15 3.0)))))))
(p (p (p (p (p (sine 0.05))))))
; 0.05 > 0.1 false, then
(p (p (p (p (p 0.05)))))
(p (p (p (p 0.1495))))
(p (p (p 0.4351)))
(p (p 0.9758))
(p -0.7892)
;Value: -.40142929

; a. 5 times f p
; b. linear growth, depends on how many times divided by three to reach "sufficiently small" namely 0.1