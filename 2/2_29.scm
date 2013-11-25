#lang scheme

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (has-mobile? branch)
  (pair? (branch-structure branch)))

; b. Find the total weight of a mobile.

(define (total-weight mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
        (display left)
        (display right)
    (cond ((and (not (has-mobile? left)) (not (has-mobile? right))) 
           (+ (branch-structure left) (branch-structure right))) 
          ((and (not (has-mobile? left)) (has-mobile? right))
           (+ (total-weight right) (branch-structure left)))
          ((and (has-mobile? left)(not (has-mobile? right)))
            (+ (total-weight left) (branch-structure right)))
          (else 
             (+ (total-weight left) (total-weight right))))))

; c. Test if a mobile is balanced.

(define (balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (cond ((and (not (has-mobile? left)) (not (has-mobile? right))) 
           (= (* (branch-structure left) (branch-length left))
              (* (branch-structure right) (branch-length right)))) 
          ((and (not (has-mobile? left)) (has-mobile? right))
           (= (* (total-weight (branch-structure right)) (branch-length right))
              (* (branch-structure left) (branch-length left))))
          ((and (has-mobile? left)(not (has-mobile? right)))
            (= (* (total-weight (branch-structure left))(branch-length left))
               (* (branch-structure right)(branch-length right))))
          (else 
             (= (* (total-weight (branch-structure left))(branch-length left))
                (* (total-weight (branch-structure right))(branch-length right)))))))

(define mobile1 (make-mobile (make-branch 2 2) (make-branch 2 2)))
(define mobile2 (make-mobile (make-branch 3 3) (make-branch 1 mobile1)))
(define mobile3 (make-mobile (make-branch 3 mobile1) (make-branch 1 mobile2)))