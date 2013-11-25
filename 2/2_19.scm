#lang scheme

(define (first-denomination ls)
  (car ls))

(define (except-first-denomination ls)
  (cdr ls))

(define (no-more? ls)
  (eq? ls '()))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define us-coins (list 25 50 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

; the order of the list doesn't matter