;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |1.9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (add a b)
  (if (= a 0)
      b
      (add1 (add (sub1 a) b))))

(define (add2 a b)
  (if (= a 0)
      b
      (add2 (sub1 a) (add1 b))))

(add 3 5)

(if (= 3 0)
    5
    (add1 (add (if (= 2 0)
               5
               (add1 (add (if (= 1 0)
                        5
                        (add1 (add (if (= 0 0)
                                 5
                                 (add1 (add (sub1 0) 5))) 5))) 5))) 5)))
                                        
                                 5
                         6
                7
     8

(add2 3 5)
  (if (= 3 0)
      5
      (  (if (= 2 0)
         6
         (  (if (= 1 0)
            7
            (if (= 0 0)
                8
                (add2 (sub1 a) (add1 b))))))))

  ;; The add function is a recursive process and the add2 function is an iterative one