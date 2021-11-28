;;; Laboration Lunar lander.
;;; Ursprunglig kod från MIT, 1982. Omarbetad av Joacim Halén, KTH 1987.
;;; Reviderad av Peter Siklosi, KTH 1993.
;;; Senast ändrad: 931006/psi

;; Innan du kan köra denna kod måste du definiera procedurerna
;; MAKE-SHIP-STATE, HEIGHT, VELOCITY, och FUEL.

;;; *** Gordon CODE!

(define (make-ship-state height velocity fuel)
  (list height velocity fuel))

(define (height ship-state)
  (car ship-state))

(define (velocity ship-state)
  (cadr ship-state))

(define (fuel ship-state)
  (caddr ship-state))

;; *** Gordon says: IT WORKS! :)))))) ;;;

;; Nu kommer Jävligt konstiga grejor....

(define full-burn (lambda (ship-state) 1))

(define no-burn (lambda (ship-state) 0))

(define ask-user (lambda (ship-state) (get-burn-rate)))

;; Uppgift 3 är därmed färdig!!!

;; Uppgift 4

;; (define (random-choice strategy-1 strategy-2)
;;   (lambda (ship-state)
;;     (if (= (random 2) 0)
;;       (strategy-1 ship-state)
;;       (strategy-2 ship-state))))

;; Uppgift 5

;; (define (height-choice strategy-1 strategy-2 hght)
;;   (lambda (ship-state)
;;     (if (> hght (height ship-state))
;;       (strategy-2 ship-state)
;;       (strategy-1 ship-state))))

;; Uppgift 6

(define (choice strategy-1 strategy-2 predikat)
  (lambda (ship-state)
    (if (predikat ship-state)
        (strategy-1 ship-state)
        (strategy-2 ship-state))))

(define (height-choice strategy-1 strategy-2 hght)
  (choice strategy-1 strategy-2
          (lambda (ship-state)
            (< hght (height ship-state)))))

(define (random-choice strategy-1 strategy-2)
  (choice strategy-1 strategy-2
          (lambda (ship-state)
            (= (random 2) 0))))
;; Uppgift 7
;; (play (height-choice no-burn (random-choice full-burn ask-user) 40))

;; Uppgift 8

(define (constant-acc ship-state)
  (let ((acc (/ (* (velocity ship-state)
                   (velocity ship-state))
                (* 2 (height ship-state)))))
    (let ((burnrt (/ (+ acc gravity)
                     engine-strength)) )
      (if (< burnrt 0)
          0
          burnrt)))))
;; Uppgift 11

(define (optimal-constant-acc ship-state)
  (let ((burnrt (constant-acc ship-state)))
    (if (< burnrt 0.7)
        0
        burnrt)))


(define update
  (lambda (ship-state fuel-burn-rate)
    (cond ((> fuel-burn-rate (/ (fuel ship-state) dt))
           (update ship-state (/ (fuel ship-state) dt)))
          ((> fuel-burn-rate 1) (update ship-state 1))
          (else
           (make-ship-state
            (+ (height ship-state) (* (velocity ship-state) dt))
            (+(velocity ship-state)
              (* (- (* engine-strength fuel-burn-rate) gravity)
                 dt))
            (- (fuel ship-state) (* fuel-burn-rate dt)))))))

(define lander-loop
  (lambda (ship-state strategy)
    (show-ship-state ship-state)
    (if (landed? ship-state)
        (end-game ship-state)
        (lander-loop (update ship-state (strategy ship-state)) strategy))));;g

(define show-ship-state
  (lambda (ship-state)
    (newline)
    (display "(")
    (display "height ") (display (height ship-state))
    (display " velocity ") (display (velocity ship-state))
    (display " fuel '") (display (fuel ship-state))
    (display '")'")))

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
          (display " You crashed!'"))
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
  (lambda (strategy)
    (lander-loop (make-initial-ship-state) strategy))))

(define make-initial-ship-state
  (lambda ()
    (make-ship-state 50 0 20)))

(define dt 1)
(define gravity .5)
(define safe-velocity -2)
(define engine-strength 1)
