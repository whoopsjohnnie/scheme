Sep 24 15:19 1997 lunar.scm Emacs buffer Page 2
(strategy-2 ship-state))))
(define (height-choice strategy-1l strategy-2 hght)
(choice strategy-1l strategy-2
(lambda (ship-state)
(< hght (height ship-state)))))
(define (random-choice strategy-1l strategy-2)
(choice strategy-1l strategy-2Z
(lambda (ship-state)
(= (random 2) 0))))
>; U 1Eft 7
;i (play (height-choice no-burn (random-choice full-burn ask-user) 40))
Muppgifkft 8
(define (constant-acc ship-state) a
(let ((acc (/ (+ (velocity ship-state) ee
(velocity ship-state))
P (+ 2 (height ship-state))))) ee
(let ((burnrt (/ (+ acc gravity)
engine-strength)) )
(if (< burnrt 0)
0
burnrt)))))
;; Uppgift 11
(define (optimal-constant-acc ship-state) = ee |
(let ((burnrt (constant-acc ship-state)))
(if (< burnrt 0.7)
0
burnrt)))
(define update
Ö anbda (ship-state fuel-burn-rate)
(cond ((> fuel-burn-rate (/ (fuel ship-state) dt))
(update ship-state (/ (fuel ship-state) dt)))
((> fuel-burn-rate 1) (update ship-state 1))
(else
& (make-ship-state |
(+ (height ship-state) (+ (velocity ship-state) dt))
(+(velocity ship-state)
(+ (- (+ engine-strength fuel-burn-rate) gravity)
dt) )
(- (fuel ship-state) (+ fuel-burn-rate dt)))))))
(define lander-1loop
(lambda (ship-state strategy)
(show-ship-state ship-state)
(if (landed? ship-state) ”
(end-game ship-state)
(lander-loop (update ship-state (strategy ship-state)) strategy) )));;g
(define show-ship-state
(lambda (ship-state)