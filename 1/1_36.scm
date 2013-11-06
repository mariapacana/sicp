#lang racket

(define (f x)
  (/ (log 1000) (log x))) 

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (display first-guess)
  (newline)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))