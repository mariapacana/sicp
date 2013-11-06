#lang racket

(define (identity x) x)

(define (inc x) (+ x 1))

(define (sum-integers a b)
  (sum-iter identity a inc b))

(define (sum term a next b)
  (display "a = ")
  (display a)
  (display ", b = ")
  (display b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-iter term a next b)
  (display "a = ")
  (display a)
  (display ", b = ")
  (display b)
  (define (iter a result)
    (if (= a 0)
        result
        (iter a (+ (next a) result))))
  (iter a b))