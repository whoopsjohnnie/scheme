;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

; > scheme < factorial.scm		

(define factorial
  (lambda (x)
    (if (< x 1)
	1
	(* x (factorial (- x 1)))
    )
  )
)

(factorial 5)
(factorial 1)
