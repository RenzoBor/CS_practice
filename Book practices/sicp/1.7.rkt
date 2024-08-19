;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |1.7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;---------------------------------------
(define (sqrt-iter guess x)
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
;; For very small numbers the answer starts to be always the same. This is bc the good-enough? has the 0.001 value
;; and the diference between the guess and this number is at one point is always smaller. And the guess can't reach the real value

(sqrt-iter 1 0.000009)


(sqrt-iter 1 17298046)

