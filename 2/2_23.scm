#lang racket

(define (for-each proc list)
  (cond ((null? list)
         true)
        (else
         ((lambda (x) (proc x))(car list))
         (for-each proc (cdr list)))))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88)) 