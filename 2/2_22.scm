#lang scheme

(define (square x)
  (expt x 2))

; 1. It's in the reverse order because you're constantly cons-ing the first element
; of the cdr onto the front of the answer (rather, you'd want the first element of 
; the cdr to be on the end of the answer.
(define (square-list items)
  (define (iter things answer)
    (display things)
    (display answer)
    (newline)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items '()))

; 2. This doesn't work because you can't cons a list onto another list. You can only 
; cons a value onto a list. 
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

; This fixes #2 by converting the cons into an append and converting the second element
; in the append from an integer to a list.
(define (square-ls items)
  (define (iter things answer)
    (display things)
    (display answer)
    (newline)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                    (list (square (car things)))))))
  (iter items '()))

