Sep 24 15:19 1997 Junaroscm Emacs buffer Page 2 




(strategy-2 
ship-state)))) 
(define (height-choice strategy-1 strategy-2 hght) (choice strategy-1 strategy-2 (lambda (ship-state) (C hght (height ship-state))))) (define (random-choice strategy-1 strategy-2) (choice strategy-1 strategy-2 (lambda (ship-state) (= (random 2) 0)))) I; Uppgift ;; >(play (height-choice no-burn 

.0 Uppgift 8 (define (constant-acc ship-state) (let ((acc (/ (* (velocity ship-state) (velocity ship-state)) (* 2 (eight ship-state)) (let ((burnrt (/ (+ acc gravity) engine-strength))) 0) 








(random-choice full-burn ask-user) 40)) 







(if (‹ burnrt 0 burnrt))) ;; Uppgift 11 



(define (optimal-constant-acc ship-state) (let ((burnrt (constant-acc ship-state))) (if (‹ burnrt 0 burnrt))) 

(define update s(lambda (ship-state fuel-burn-rate) (cond ( (> fuel-burn-rate (/ (fuel ship-state) dt)) (update ship-state (/ (fuel ship-state) dt))) ((> fuel-burn-rate 1) (update ship-state I)) (else (make-ship-state (+ (height ship-state) (* (velocity ship-state) dt)) (+(velocity ship-state) (* (- (* engine-strength fuel-burn-rate) gravity) dt)) (- (fuel ship-state) (* fuel-burn-rate dt))))))) 






(define Lander-loop (lambda (ship-state strategy) (show-ship-state ship-state) (if (landed? ship-state) (end-game ship-state) 



• 
(lander-loop (update ship state (strategy ship-state)) strategy))));;g (define show-ship-state (lambda (ship-state) 
