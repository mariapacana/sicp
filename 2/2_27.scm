#lang scheme

; still confused why this only works if I say (list (deep-reverse (car mylist)))
(define (deep-reverse mylist)
  (cond ((null? mylist) '())
        ((not (pair? mylist)) mylist)
        (else 
         (append (deep-reverse (cdr mylist)) (list (deep-reverse (car mylist)))))))

(define (reverse mylist)
  (if (null? (cdr mylist))
      (list (car mylist))
      (append (reverse (cdr mylist)) (list (car mylist)))))

(define x (list (list 1 2) (list 3 4)))

