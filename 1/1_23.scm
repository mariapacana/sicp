#lang planet neil/sicp

(define (square x)
  (* x x))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
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

(timed-prime-test 1009); 197 (329)
(timed-prime-test 1013); 192 (128)
(timed-prime-test 1019); 192 (127)
(timed-prime-test 10007); 2161 (1219)
(timed-prime-test 10009); 2026 (1285)
(timed-prime-test 10037); 1977 (1264)
(timed-prime-test 100003); 23325 (12459)
(timed-prime-test 100019); 19874 (12392)
(timed-prime-test 100043); 19962 (11991)
(timed-prime-test 1000003); 190170 (126464)
(timed-prime-test 1000033); 213399 (120695)
(timed-prime-test 1000037); 259015 (120761)