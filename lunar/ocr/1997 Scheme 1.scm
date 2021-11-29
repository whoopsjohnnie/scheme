Sep 24 15:19 1997 lunar.scm Emacs buffer Page 1
i; Laboration Lunar lander. 2 1987
i; Ursprunglig kod frin MIT, 1982. Omarbetad av Joacim HalÖn, KTH :
;:; Reviderad av Peter Siklosi, KTH 1993.
ii; Senast öndrad: 931006/psi
;; Innan du kan k-ra denna kod miIste du definiera procedurerna
;; MAKE-SHIP-STATE, HEIGHT, VELOCITY, och FUEL.
ji; TAX Gordon CODE!
(define (make-ship-state height velocity fuel)
(list height velocity fuel))
fine (height ship-state)
IFcar ship-state))
(define (velocity ship-state)
(cadr ship-state))
"Ieine (fuel ship-state)
(caddr ship-state))
;; xx Gordon says: IT WORKS! :)))))) ;;;
;; Nu kommer JÖvligt konstiga grejor....
(define full-burn (lambda (ship-state) 1))
(define no-burn (lambda (ship-state) 0))
(define ask-user (lambda (ship-state) (get-burn-rate)))
;; Uppgift 3 ör dörmed fördig!!!
;; Uppgift 4
Maefine (random-choice strategy-1l strategy-2)
;; (lambda (ship-state) .
;i (if (= (random 2) 0)
i (strategy-1l ship-state)
J (strategy-2 ship-state))))
;; Uppgift 5
;; (define (height-choice strategy-1l strategy-2 hght)
;; (lambda (ship-state)
;; (if (> hght (height ship-state))
ji (strategy-2 ship-state)
; 3 (strategy-1l ship-state))))
;; Uppglft 6
|
(define (choice strategy-1l strategy-2 predikat)
(lambda (ship-state)
(if (predikat ship-state)
(strategy-1l ship-state)