(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (mult x y)
  (iter-helper 0 x y))

(define (iter-helper a x y)
  (display x)
  (display ",")
  (display y)
  (newline)
  (cond ((= y 0) a)
        ((even? y) (iter-helper a (double x) (halve y)))
        (else (iter-helper (+ a x) x (- y 1)))))

(display (mult 4 100))