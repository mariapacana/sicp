(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (mult x y)
  (cond ((= y 0) 0)
        ((even? y) (mult (double x) (halve y)))
        (else (+ x (mult x (- y 1))))))

(display (mult 3 100))