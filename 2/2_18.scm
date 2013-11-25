#lang racket

(define (reverse mylist)
  (if (null? (cdr mylist))
      (list (car mylist))
      (append (reverse (cdr mylist)) (list (car mylist)))))
         
(reverse (list 1 4 9 16 25))