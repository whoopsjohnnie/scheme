;;; Laboration Lunar lander.
;;; Ursprunglig kod från MIT, 1982. Omarbetad av Joacim Halén, KTH 1987.
;;; Reviderad av Peter Siklosi, KTH 1993.
;;; Senast ändrad: 931006/psi

;; Innan du kan köra denna kod måste du definiera procedurerna
;; MAKE-SHIP-STATE, HEIGHT, VELOCITY, och FUEL.

(define update
  (lambda (ship-state fuel-burn-rate)
    (make-ship-state
     (+ (height ship-state) (* (velocity ship-state) dt))
     (+ (velocity ship-state)
        (* (- (* engine-strength fuel-burn-rate) gravity)
           dt))
     (- (fuel ship-state) (* fuel-burn-rate dt)))))

(define lander-loop
  (lambda (ship-state)
    (show-ship-state ship-state)
    (if (landed? ship-state)
        (end-game ship-state)
        (lander-loop (update ship-state (get-burn-rate))))))

(define show-ship-state
  (lambda (ship-state)
    (newline)
    (display "(")
    (display "height ") (display (height ship-state))
    (display " velocity ") (display (velocity ship-state))
    (display " fuel ") (display (fuel ship-state))
    (display ")")))

(define landed?
  (lambda (ship-state)
    (<= (height ship-state) 0)))

(define end-game
  (lambda (ship-state)
    (let ((final-velocity (velocity ship-state)))
      (newline)
      (display final-velocity)
      (if (>= final-velocity safe-velocity)
          (display " Good landing!")
          (display " You crashed!"))
      (newline)
      (display "GAME OVER")
      (newline))))


(define get-burn-rate
  (lambda ()
    (newline)
    (display "Burn? ")
    (if (eqv? (read) 'y)
        1
        0)))

(define play
  (lambda ()
    (lander-loop (make-initial-ship-state))))

(define make-initial-ship-state
  (lambda ()
    (make-ship-state 50 0 20)))

(define dt 1)
(define gravity .5)
(define safe-velocity -2)
(define engine-strength 1)
