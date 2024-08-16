;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |1.6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;---------------------------------------
#;(define (sqrt-iter guess x)
  (if (good-enough? guess x)
  guess
  (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (sqr guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))
;;----------------------------------------

(define (new-if p then els)
  (cond [p then]
        [else els]))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)


(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
  guess
  (sqrt-iter (improve guess x) x)))


(sqrt-iter 1 4)

;; In this case, the execution enters in an infinite loop.