;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |1.11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; Recursive function

(define (f1 n)
  (cond [(< n 3) n]
        [else (+
               (f1 (- n 1))
               (* 2 (f1 (- n 2)))
               (* 3 (f1 (- n 3))))]))

;; iterative process solution:

(define (f2 n)
  (f-iter  0 1 2 n))

(define (f-iter a b c count)
  (if (< count 3)
      count
      (f-iter c (* b 2)  (* a 3) (- count 1))))
