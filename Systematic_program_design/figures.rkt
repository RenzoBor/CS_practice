;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname figures) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(triangle 30 "solid" "red")
(rectangle 60 40 "solid" "green")
(text "hello" 25 "orange")
(above (circle 10 "solid" "light brown") (rectangle 15 30 "solid" "light brown") (beside (circle 12 "solid" "light brown") (circle 12 "solid" "light brown")))