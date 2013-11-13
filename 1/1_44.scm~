#lang racket

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

((repeated square 2) 5)
