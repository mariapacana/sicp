#lang racket

(define (identity x) x)

(define (inc x) (+ x 1))

(define (factorial b)
  (accumulate * b identity 1 inc b))

(define (accumulate combiner null-value term a next b)
  (display "a = ")
  (display a)
  (display ", b = ")
  (display b)
  (if (= a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b))))

(define (accum-iter combiner null-value term a next b)
  (display "a = ")
  (display a)
  (display ", b = ")
  (display b)
  (define (iter a result)
    (if (= a b)
        (combiner result (term a))
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))
