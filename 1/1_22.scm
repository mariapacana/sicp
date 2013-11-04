#lang planet neil/sicp

(define (square x)
  * x x)

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start numprimes)
  (timed-prime-test start)
  (if (= numprimes 0) 
      (display " we're done")
      (if (prime? start) 
          (search-for-primes (+ start 1) (- numprimes 1))
          (search-for-primes (+ start 1) numprimes))))

(search-for-primes 1000 3); 1009(197), 1013(192), 1019(192)
;(search-for-primes 10000 3); 10007(2161), 10009(2026), 10037(1977)
;(search-for-primes 100000 3); 100003(23325), 100019(19874), 100043(19962)
;(search-for-primes 1000000 3); 1000003(190170), 1000033(213399), 1000037(259015)