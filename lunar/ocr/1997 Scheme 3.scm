Sep 24 15:19 1997 lunar.scm Emacs buffer Page 3
(newline)
(display " ()
(display "height ") (display (height ship-state))
(display " velocity ") (display (velocity ship-state))
(display " fuel '") (display (fuel ship-state))
(display '")'")))
(define landed?
(lambda (ship-state)
(<= (height ship-state) 0)))
(define end-game |
(lambda (ship-state)
a (let ((final-velocity (velocity ship-state)))
& (newline)
(display final-velocity)
(if (>= final-velocity safe-velocity)
(display " Good landing!")
| (display " You crashed!'"))
| Ö (newline)
(display "GAME OVER")
(newline) ))) |
| (define get-burn-rate
(lambda ()
(newline) |
(display "Burn? '") | - a | or
(if (eqv? (read) '"y)
l
0)))
(define play
(lambda (strategy)
(lander-loop (make-initial-ship-state) strategy) )))
Örfine make-initial-ship-state
(lambda ()
(make-ship-state 50 0 20)))
(define dt 1)
Öns gravity .5) |
efine safe-velocity -2)
(define engine-strength 1)