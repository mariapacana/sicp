(define (square x)
	(* x x))

(define (sum-of-squares x y)
	(+ (square x) (square y)))

(define (bigger a b c)
	(cond ((and (> b a) (> c a)) (sum-of-squares b c))
				((and (> b c) (> a c)) (sum-of-squares a b))
				((and (> c b) (> a b)) (sum-of-squares a c))))

(display (bigger 1 2 3))