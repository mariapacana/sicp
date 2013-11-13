#lang racket

(define (double arg)
  (lambda (x) (arg (arg x))))

(define (inc x)
  (+ 1 x))

(double inc)