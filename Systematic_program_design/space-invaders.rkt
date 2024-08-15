;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname space-invaders) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; Space Invaders


;; Constants:

(define WIDTH  300)
(define HEIGHT 500)

(define INVADER-X-SPEED 1.5)  ;speeds (not velocities) in pixels per tick
(define INVADER-Y-SPEED 1.5)
(define TANK-SPEED 2)
(define MISSILE-SPEED -10)

(define HIT-RANGE 10)

(define INVADE-RATE 200)

(define BACKGROUND (empty-scene WIDTH HEIGHT))

(define INVADER
  (overlay/xy (ellipse 10 15 "outline" "blue")              ;cockpit cover
              -5 6
              (ellipse 20 10 "solid"   "blue")))            ;saucer

(define TANK
  (overlay/xy (overlay (ellipse 28 8 "solid" "black")       ;tread center
                       (ellipse 30 10 "solid" "green"))     ;tread outline
              5 -14
              (above (rectangle 5 10 "solid" "black")       ;gun
                     (rectangle 20 10 "solid" "black"))))   ;main body

(define TANK-HEIGHT/2 (/ (image-height TANK) 2))

(define MISSILE (ellipse 5 15 "solid" "red"))



;; Data Definitions:

(define-struct game (invaders missiles tank))
;; Game is (make-game  (listof Invader) (listof Missile) Tank)
;; interp. the current state of a space invaders game
;;         with the current invaders, missiles and tank position

;; Game constants defined below Missile data definition

#;
(define (fn-for-game s)
  (... (fn-for-loinvader (game-invaders s))
       (fn-for-lom (game-missiles s))
       (fn-for-tank (game-tank s))))



(define-struct tank (x dir))
;; Tank is (make-tank Number Integer[-1, 1])
;; interp. the tank location is x, HEIGHT - TANK-HEIGHT/2 in screen coordinates
;;         the tank moves TANK-SPEED pixels per clock tick left if dir -1, right if dir 1

(define T0 (make-tank (/ WIDTH 2) 1))   ;center going right
(define T1 (make-tank 50 1))            ;going right
(define T2 (make-tank 50 -1))           ;going left

#;
(define (fn-for-tank t)
  (... (tank-x t) (tank-dir t)))



(define-struct invader (x y d))
;; Invader is (make-invader Number Number Number[-1, 1])
;; interp. the invader is at (x, y) in screen coordinates
;;         d is direction, 1 is right, -1 is left

(define I1 (make-invader 150 100 1))           ;not landed, moving right
(define I2 (make-invader 150 HEIGHT -1))       ;exactly landed, moving left
(define I3 (make-invader 150 (+ HEIGHT 10) 1)) ;> landed, moving right


#;
(define (fn-for-invader invader)
  (... (invader-x invader) (invader-y invader) (invader-dx invader)))


(define-struct missile (x y))
;; Missile is (make-missile Number Number)
;; interp. the missile's location is x y in screen coordinates

(define M1 (make-missile 150 300))                       ;not hit U1
(define M2 (make-missile (invader-x I1) (+ (invader-y I1) 10)))  ;exactly hit U1
(define M3 (make-missile (invader-x I1) (+ (invader-y I1)  5)))  ;> hit U1

#;
(define (fn-for-missile m)
  (... (missile-x m) (missile-y m)))

(define G0 (make-game empty empty T0))
(define G1 (make-game empty empty T1))
(define G2 (make-game (list I1) (list M1) T1))
(define G3 (make-game (list I1 I2) (list M1 M2) T1))

;; ListOfInvader is one of:
;; - empty
;; - (cons Invader ListOfInvader)
;; Interp. A list of invaders
(define LOI0 empty)
(define LOI1 (cons (make-invader 80 156 1) empty))
(define LOI2 (cons (make-invader 10 50 -1) (cons (make-invader 70 110 1) empty)))

(define (fn-for-loi loi)
  (cond [(empty?) (...)]
        [else (...
               (fn-for-invader (first loi))
               (fn-for-loi (rest loi)))]))
;; Template rules used:
;; One of: 2 fields
;; Atomic distinct
;; Compound (cons Invader ListOfInvader)
;; Reference: fn-for-invader (first loi)
;; Self-reference: (fn-for-loi (rest loi))

;; ListOfMissile is one of:
;; - empty
;; - (cons Missile ListOfMissile)
;; Interp. A list of invaders
(define LOM0 empty)
(define LOM1 (cons (make-missile 150 60) empty))
(define LOM2 (cons (make-missile 30 15) (cons (make-missile 60 90) empty)))

(define (fn-for-lom lom)
  (cond [(empty?) (...)]
        [else (...
               (fn-for-missile (first lom))
               (fn-for-lom (rest lom)))]))

;; Template rules used:
;; One of: 2 fields
;; Atomic distinct
;; Compound (cons Missile ListOfMissile)
;; Reference: fn-for-invader (first lom)
;; Self-reference: (fn-for-lom (rest lom))
;; =================
;; Functions:

;; Game -> Game
;; start the world with ...
;; 
(define (main g)
  (big-bang g                           ; Game
    (on-tick   next-game)        ; Game -> Game
    (to-draw   render)           ; Game -> Image
    (stop-when game-over)        ; Game -> Boolean
    (on-key    handle-move)))

;; Game -> Game
;; produce the next game , that includes the invaders, the ship and missiles
(check-expect (next-game G0) (make-game empty empty (make-tank (+ (/ WIDTH 2) TANK-SPEED) 1)))
(check-expect (next-game G1) (make-game empty empty (make-tank (+ 50 TANK-SPEED) 1)))
(check-expect (next-game G2) (make-game (list (make-invader (+ 150 INVADER-X-SPEED) (+ 100 INVADER-Y-SPEED) 1))
                                        (list (make-missile 150 (+ 300 MISSILE-SPEED)))
                                        (make-tank (+ 50 TANK-SPEED) 1)))
(check-expect (next-game (make-game (list (make-invader  WIDTH  100 1) (make-invader 80 145 -1)) (list M1 M2) (make-tank 0 -1)))
              (make-game (list (make-invader (+  WIDTH  INVADER-X-SPEED) (+ 100 INVADER-Y-SPEED) -1) (make-invader (- 80 INVADER-X-SPEED) (+ 145 INVADER-Y-SPEED) -1))
                         (list (make-missile 150 (+ 300 MISSILE-SPEED)) (make-missile (missile-x M2) (+ (missile-y M2) MISSILE-SPEED)))
                         (make-tank 0 -1)))

;(define (next-game g) ...)
;; < Template from Game >

(define (next-game g)
  (make-game (next-invaders (if (random-switch "x")            ;; if for invader spawn (produce true or false randomly per game tick)
                                (random-inv (game-invaders g)) ;; if true spawn random invader
                                (game-invaders g)))            ;; if false no spawn  
             (next-missiles (game-missiles g))
             (next-tank (game-tank g))))

;; ListOfInvader -> ListOfInvader
;; Produce the next loi

(check-expect (next-invaders (cons (make-invader 65 100 1) empty)) (cons (make-invader (+ 65 INVADER-X-SPEED) (+ 100 INVADER-Y-SPEED) 1) empty))
(check-expect (next-invaders (list (make-invader  WIDTH  100 1) (make-invader 80 145 -1))) (list (make-invader (+  WIDTH  INVADER-X-SPEED) (+ 100 INVADER-Y-SPEED) -1) (make-invader (- 80 INVADER-X-SPEED) (+ 145 INVADER-Y-SPEED) -1)))

;(define (next-invaders loi) loi)

(define (next-invaders loi)
  (cond [(empty? loi) empty]
        [else (cons
               (next-invader (first loi))
               (next-invaders (rest loi)))]))
;; ListOfInvader -> ListOfInvader
;; generate a random invader
(check-random (random-inv empty) (cons (make-invader (random WIDTH) 0 1) empty))
(check-random (random-inv (cons I1 empty)) (cons I1 (cons (make-invader (random WIDTH) 0 1) empty)))

;(define (random-inv loi) loi)
(define (random-inv loi)
  (append loi (cons (make-invader (random WIDTH) 0 (if (= (random 2) 1)
                                                       1
                                                       -1)) empty)))

(define (random-switch x)            ;; RANDOM SWITCH FOR INVADER SPAWN (when true, an invader is spawned)
  (<= (random INVADE-RATE) 5))
      

;; Invader -> Invader
;; Produce the next invader
(check-expect (next-invader (make-invader 50 65 1)) (make-invader (+ 50 INVADER-X-SPEED) (+ 65 INVADER-Y-SPEED) 1))
(check-expect (next-invader (make-invader 10 80 -1)) (make-invader (- 10 INVADER-X-SPEED) (+ 80 INVADER-Y-SPEED) -1))
(check-expect (next-invader (make-invader 50 65 1)) (make-invader (+ 50 INVADER-X-SPEED) (+ 65 INVADER-Y-SPEED) 1))
(check-expect (next-invader (make-invader 0 80 -1)) (make-invader (- 0 INVADER-X-SPEED) (+ 80 INVADER-Y-SPEED) 1))

;(define (next-invader i) i)
(define (next-invader i)
  (if (or (and (<= (invader-x i) 0) (= (invader-d i) -1)) (and (>= (invader-x i) WIDTH) (= (invader-d i) 1)))
      (make-invader (+ (invader-x i) (* (invader-d i) INVADER-X-SPEED)) (+ (invader-y i) INVADER-Y-SPEED) (- (invader-d i)))
      (make-invader (+ (invader-x i) (* (invader-d i) INVADER-X-SPEED)) (+ (invader-y i) INVADER-Y-SPEED) (invader-d i))))

;; ListOfMissiles -> ListOfMissiles
;; Produce the next lom
(check-expect (next-missiles (cons (make-missile 60 155) empty)) (cons (make-missile 60 (+ 155 MISSILE-SPEED)) empty))
(check-expect (next-missiles (cons (make-missile 200 80) (cons (make-missile 99 0) empty))) (cons (make-missile 200 (+ 80 MISSILE-SPEED)) empty))
;(define (next-missiles lom) lom)
(define (next-missiles lom)
  (cond [(empty? lom) empty]
        [else (if (<= (missile-y (first lom)) 0)
                  (next-missiles (rest lom))
                  (cons (next-missile (first lom)) (next-missiles (rest lom))))]))
 
;; Missile -> Missile
;; Produce the next missile
(check-expect (next-missile (make-missile 30 15)) (make-missile 30 (+ 15 MISSILE-SPEED)))
(check-expect (next-missile (make-missile 75 75)) (make-missile 75 (+ 75 MISSILE-SPEED)))
;(define (next-missile m) m)

(define (next-missile m)
  (make-missile (missile-x m) (+ (missile-y m) MISSILE-SPEED)))
;; Tank -> Tank
;; Produce the next tank moving in the x position
(check-expect (next-tank (make-tank 40 1)) (make-tank (+ 40 TANK-SPEED) 1))
(check-expect (next-tank (make-tank 125 -1)) (make-tank (- 125 TANK-SPEED) -1))
(check-expect (next-tank (make-tank 0 -1)) (make-tank 0 -1))
(check-expect (next-tank (make-tank WIDTH 1)) (make-tank WIDTH 1))

;(define (next-tank t) t)

(define (next-tank t)
  (if (or (<= (tank-x t) 0) (>= (tank-x t) WIDTH))
      (make-tank (tank-x t) (tank-dir t))
      (make-tank (+ (tank-x t) (* TANK-SPEED (tank-dir t))) (tank-dir t))))

;; Game -> Image
;; render the game image 
(check-expect (render G0) (place-image TANK (/ WIDTH 2) (- HEIGHT TANK-HEIGHT/2) BACKGROUND))
(check-expect (render G1) (place-image TANK 50 (- HEIGHT TANK-HEIGHT/2) BACKGROUND))
(check-expect (render G2) (place-image INVADER 150 100
                                       (place-image MISSILE 150 300
                                                    (place-image TANK 50 (- HEIGHT TANK-HEIGHT/2) BACKGROUND))))
(check-expect (render G3) (place-image INVADER 150 100
                                       (place-image INVADER 150 HEIGHT
                                                    (place-image MISSILE 150 300
                                                                 (place-image MISSILE (invader-x I1) (+ (invader-y I1) 10)
                                                                              (place-image TANK 50 (- HEIGHT TANK-HEIGHT/2) BACKGROUND))))))

;(define (render g) ...)

(define (render g)
  (render-invaders (game-invaders g) (render-missiles (game-missiles g) (render-tank (game-tank g)))))

;; ListOfInvader Image -> image
;; Recieve a list of invaders and an image, produce the combination
(check-expect (render-invaders empty BACKGROUND) BACKGROUND)
(check-expect (render-invaders (cons (make-invader 65 80 1) empty) BACKGROUND) (place-image INVADER 65 80 BACKGROUND))
(check-expect (render-invaders (cons (make-invader 80 155 -1) (cons (make-invader 100 30 1) empty)) BACKGROUND) (place-image INVADER 80 155
                                                                                                                             (place-image INVADER 100 30 BACKGROUND)))
;(define (render-invaders loi img) img)

(define (render-invaders loi img)
  (cond [(empty? loi) img]
        [else (place-image INVADER
                           (invader-x (first loi))
                           (invader-y (first loi))
                           (render-invaders (rest loi) img))]))



;; ListOfMissile Image -> image
;; Recieve a list of missiles and an image, produce the combination
(check-expect (render-missiles LOM0 BACKGROUND) BACKGROUND)
(check-expect (render-missiles LOM1 BACKGROUND) (place-image MISSILE 150 60 BACKGROUND))
(check-expect (render-missiles LOM2 BACKGROUND) (place-image MISSILE 30 15
                                                             (place-image MISSILE 60 90 BACKGROUND)))
;(define (render-missiles lom img) img)
(define (render-missiles lom img)
  (cond [(empty? lom) img]
        [else (place-image
               MISSILE
               (missile-x (first lom))
               (missile-y (first lom))
               (render-missiles (rest lom) img))]))

;; Tank -> Image
;; Produce the image of the tank in the background
(check-expect (render-tank T0) (place-image TANK (/ WIDTH 2) (- HEIGHT TANK-HEIGHT/2) BACKGROUND))
(check-expect (render-tank T1) (place-image TANK 50 (- HEIGHT TANK-HEIGHT/2) BACKGROUND))
 
;(define (render-tank t) BACKGROUND)
(define (render-tank t)
  (place-image TANK (tank-x t) (- HEIGHT TANK-HEIGHT/2) BACKGROUND))

;;Game KeyEvent -> Game
;; When the left arrow is pressed the tank goes left, when right arrow is pressed tank goes right // AND the shoot missile function
(check-expect (handle-move (make-game  empty empty (make-tank 50 1)) "left") (make-game  empty empty (make-tank 50 -1)))
(check-expect (handle-move (make-game  empty empty (make-tank 50 -1)) "left") (make-game  empty empty (make-tank 50 -1)))
(check-expect (handle-move (make-game  empty empty (make-tank 50 -1)) "right") (make-game  empty empty (make-tank 50 1)))
(check-expect (handle-move (make-game  empty empty (make-tank 50 1)) "right") (make-game  empty empty (make-tank 50 1)))
(check-expect (handle-move (make-game  empty empty (make-tank 50 1)) "t") (make-game  empty empty (make-tank 50 1)))
(define (handle-move g ke)
  (cond [(key=? ke "left") (make-game (game-invaders g) (game-missiles g) (go-left (game-tank g)))]
        [(key=? ke "right") (make-game (game-invaders g) (game-missiles g) (go-right (game-tank g)))]
        [(key=? ke " ") (make-game (game-invaders g) (shoot-missile (game-missiles g) (game-tank g)) (game-tank g))]
        [else 
         g]))

;; Tank -> Tank
;; Recieve a tank and change its direction

(define (go-left t)
  (make-tank (tank-x t) -1))

(define (go-right t)
  (make-tank (tank-x t) 1))

;; ListOfMissile Tank -> ListOfMissile
;; Generate a missile in the tanks position
(check-expect (shoot-missile empty T0) (cons (make-missile (/ WIDTH 2) (- HEIGHT (image-height TANK))) empty))
(check-expect (shoot-missile (cons M1 empty) T2) (cons M1 (cons (make-missile 50 (- HEIGHT (image-height TANK))) empty)))
(define (shoot-missile lom t)
  (append lom (cons (make-missile (tank-x t) (- HEIGHT (image-height TANK))) empty)))

;; Game -> Game
;; Recieve the lom and the loi and if one missile touches an invader (HIT-RANGE arround its position) both desapears
(check-expect (hit-system G0) G0)
(check-expect (hit-system (make-game (list I1) (list M1) T1)) (make-game (list I1) (list M1) T1))
(check-expect (hit-system (make-game (list I1) (list M1 M2) T1)) (make-game empty (list M1) T1))
(check-expect (hit-system (make-game (list I1) (list M1 M3) T1)) (make-game empty (list M1) T1))
;(define (hit-system g) g)

(define (hit-system s)
    (if (hit? (game-invaders s) (game-missiles s))
        (make-game (calculate-invaders (game-invaders s) (game-missiles s)) (calculate-missiles (game-missiles s) (game-invaders s)) (game-tank s))
        (make-game (game-invaders s) (game-missiles s) (game-tank s))))

;; ListOfInvader ListOfMissile -> Boolean
;; Recieve a loi and a lom and produce true if a missile hit an invader false otherwise
  (define)

;; ListOfInvader ListOfMissile -> ListOfInvader

;; ListOfMissile ListOfInvader -> ListOfMissile

;; Game -> Boolean
;; When a invader lands (invader-y = HEIGHT) the game is over
;; !!!
(define (game-over g) false)