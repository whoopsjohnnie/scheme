Sep 24 15:19 1997 lunar.scm Emacs buffer Page 1 
; ; ; Laboration Lunar lander. ,;; Ursprunglig kod frin MIT, 1982. Omarbetad av Joacim Halon, KTH 19870 ,;; Reviderad av Peter Siklosi, KTH 19930 ,;; Senast ondrad: 931006/psi ;; Innan du kan k-ra denna kod miste du definiera procedurerna ;; MAKE-SHIP-STATE, HEIGHT, VELOCITY, och FUEL. 
;90 *** Gordon CODE! 
(define (make-ship-state height velocity fuel) (list height velocity fuel)) 

(define (height ship-state) ,, (car ship-state)) 
(define (velocity ship-state) (cadr ship-state)) 




„.?fine (fuel ship-state) (caddr ship-state)) 










if ** * Gordon says: IT WORKS! :)))))) • 


;; Nu kommer Jevligt konstiga grejor.. 

(define full-burn (lambda (ship-state) 1)) (define no-burn (lambda (ship-state) 0)) (define ask-user (lambda (ship-state) (get-burn-rate))) ;; Uppgift 3 or domed fordig!!! ;; Uppgift 



;""(define (random-choice ;; (lambda (ship-state) ;; (if (= (random 2) 0) (strategy-1 ship-state) (strategy-2 ship-state)) 


S 

Uppgift 


;;(define (height-choice strategy-1 ;; (lambda (ship-state) ;; (if (> hght (height ship-state)) ;; (strategy-2 ship-state) If (strategy-1 ship-state)))) 
;; Uppgift 6 
(define (choice strategy-1 strategy-2 predikat) (lambda (ship-state) (if (predikat ship-state) (strategy-1 ship-state) 
