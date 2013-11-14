#lang racket

(define (square x)
  (* x x))

(define (d i)
  (if (= i 1)
      1
      (+ 2 (d (- i 1)))))

(define (n i)
  (lambda (x)
    (if (= i 1)
      x
      (square x))))

(define (cont-frac n d k x)
  (cont-frac-sub n d k 1 x))
         
(define (cont-frac-sub n d k i x)
  (if (= k i)
      (- (/ ((n i) x) (d i)))
      (/ ((n i) x) (- (d i) (cont-frac-sub n d (- k 1) i x)))))

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   1
                   (+ 2 (d (- i 1)))))
             (lambda (i)
               
             d k x))