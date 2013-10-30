; Design a procedure that evolves an iterative exponentiation process that uses 
; successive squaring and uses a logarithmic number of steps, as does fast-expt. 

(define (square n)
  (* n n))

(define (iter-helper a b n)
  (display (* a (expt b n)))
  (cond ((= n 0) a)
        ((even? n)(iter-helper a (square b) (/ n 2)))
        (else (iter-helper (* a b) b (- n 1)))))

(define (iter-expt b n)
  (iter-helper 1 b n))

(display (iter-expt 3 3))