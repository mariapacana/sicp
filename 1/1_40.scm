#lang racket

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (cubic-eqn a b c y)
  (lambda (x)
    (- (+ (cube x) (* a (square x)) (* b x) c) y))) 

(define (cubic a b c)
  (newtons-method 
   (lambda (y)
    (cubic-eqn a b c y)) 1.0))

