#lang racket

(define (identity x) x)

(define (inc x) (+ x 1))

(define (factorial b)
  (product-iter identity 1 inc b))

(define (product term a next b)
  (display "a = ")
  (display a)
  (display ", b = ")
  (display b)
  (if (= a b)
      b
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (display "a = ")
  (display a)
  (display ", b = ")
  (display b)
  (define (iter a result)
    (if (= a b)
        (* result (term a))
        (iter (next a) (* (term a) result))))
  (iter a 1))