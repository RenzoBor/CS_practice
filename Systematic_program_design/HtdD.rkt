;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtdD) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Student grades is one of:
;; - "A"
;; - "B"
;; - "C"
;; Interp , characters are student's grades in a course
;; <examples are redundant to enumeration>
#;
(define (fn-fpr-Sg sg)
  (cond [(string? sg "A") (...)]
        [(string? sg "B") (...)]
        [(string? sg "C") (...)]))
;; template rules used:
; -one of 3 cases
; -atomic-distinct-value: A
; -atomic-distinct-value: B
; -atomic-distinct-value: C