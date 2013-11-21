#lang racket

(define (logbaseb a b)
  (/ (log a) (log b)))

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (not-divisible dividend divisor)
  (not (eq? (remainder dividend divisor) 0)))

(define (quotient x divisor)
  (display x)
  (display ",")
  (display divisor)
  (newline)
  (if (not-divisible x divisor)
      0
      (+ 1 (quotient (/ x divisor) divisor))))

(define (car z)
  (quotient z 2))

(define (cdr z)
  (quotient z 3))

