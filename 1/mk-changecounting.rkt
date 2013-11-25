#lang cKanren

(require cKanren/miniKanren)
(require cKanren/fd)

#;(run* (q) (fresh (coin)
                 (conde
                  [(== coin (build-num 50))]
                  [(== coin (build-num 25))]
                  [(== coin (build-num 10))]
                  [(== coin (build-num 5))]
                  [(== coin (build-num 1))])
                 (minuso (build-num 100) coin q)))

; This generates sequences rather than sets, although order does not matter for SICP

(define changeo 
  (lambda (in-ls out-ls remaining)
                 (conde
                  [(== remaining (build-num 0))
                   (== in-ls out-ls)]
                  [(poso remaining)
                   (fresh (coin res)
                          (conde
                           [(== coin (build-num 50))]
                           [(== coin (build-num 25))]
                           [(== coin (build-num 10))]
                           [(== coin (build-num 5))]
                           [(== coin (build-num 1))])
                           (minuso remaining coin res)
                           (changeo (cons coin in-ls) out-ls res))])))
(run 100 (q) (changeo '() q (build-num 100)))