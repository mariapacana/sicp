#lang racket
; Obtain the n-fold smoothed version of a function.

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

(define (compose f g)
  (lambda(x) (f (g x))))

(define (repeated func times)
  (repeated-iter 0 func times))

(define (repeated-iter result func times)
  (if (= times 0)
      result
      (repeated-iter (compose func func) func (- times 1))))

(define dx 0.00001)

(define (av-3 a b c)
  (/ (+ a b c) 3))

(define (smooth f)
  (lambda(x)
    (av-3 (f (- x dx))
          (f x)
          (f (+ x dx)))))
 
(define (n-fold-smooth f times)
  ((repeated smooth times) f))