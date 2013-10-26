; 1.11 f(n) = n if n < 3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3. 

; recursive version
(define (recursive n)
	(if (> 3 n) 
			n
		  (+ (recursive (- n 1)) (* 2 (recursive (- n 2))) (* 3 (recursive (- n 3))))))

; iterative version
; problem with count - 1
; should compare count to n

(define (iterative n)
	(iterative-helper 0 1 2 n))

(define (iterative-helper a b c count)
	(if (> 3 count)
			count
			(iterative-helper b c (+ (* 3 a) (* 2 b) c) (- count 1))))