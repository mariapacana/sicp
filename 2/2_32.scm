#lang scheme

(define nil '())

(define (subsets s)
  (if (null? s)
      (list nil)  ; set of nil
      (let ((rest (subsets (cdr s))))
        (newline)
        (append rest (map 
                      (lambda (elem) (cons (car s) elem)) 
                      rest)))))
(subsets '(1 2 3))