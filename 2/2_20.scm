#lang scheme

(define (same-parity-int x y)
   (eq? (odd? x) (odd? y)))
     
(define (same-parity x . ls)
  (display ls)
  (newline)
  (if (null? ls)
      '()
      (if (same-parity-int x (car ls))
          (cons (car ls) (apply same-parity x (cdr ls)))
          (apply same-parity x (cdr ls)))))

(same-parity 1 2 3 4 5 6 7)