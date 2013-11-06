#lang planet neil/sicp

(define (square x)
  (* x x))

(define (expmod base exp m)
  (display "b=")
  (display base)
  (display ", exp=")
  (display exp)
  (display ", m=")
  (display m)
  (newline)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 5)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start numprimes)
  (timed-prime-test start)
  (if (= numprimes 0) 
      (display " we're done")
      (if (fast-prime? start 5) 
          (search-for-primes (+ start 1) (- numprimes 1))
          (search-for-primes (+ start 1) numprimes))))

;(search-for-primes 1000 3); 1009(9), 1013(8), 1019(9)
;(search-for-primes 10000 3); 10007(22), 10009(22), 10037(22)
;(search-for-primes 100000 3); 100003(79), 100019(66), 100043(66)
;(search-for-primes 1000000 3); 1000003(212), 1000033(207), 1000037(213)
;(search-for-primes 10000000 3)

;(expmod 2 10000 10000)
(timed-prime-test 10009)