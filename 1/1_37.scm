#lang planet neil/sicp

; recursive

(define (cont-frac n d k)
  (cont-frac-sub n d k 1))
         
(define (cont-frac-sub n d k i)
  (if (= k i)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (cont-frac-sub n d (- k 1) i)))))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           8)
