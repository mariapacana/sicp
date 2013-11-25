#lang scheme

(define (square-list items)
  (if (null? items)
      '()
      (cons (expt (car items) 2) (square-list (cdr items)))))

(define (square-list-map ls)
  (map (lambda (x) (* x x)) ls))

(square-list (list 1 2 3 4))