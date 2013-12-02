#lang scheme

(define (accumulate op initial sequence)
  (display initial)
  (display sequence)
  (newline)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (square x)
  (* x x))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))