;;;; common-lisp.el

(defun compile-all ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (beginning-of-buffer)
  (let ((pnt (point)))
    (while (< pnt (progn (forward-list) (point)))
      (slime-eval-last-expression)
      (slime-compile-defun)
      (setq pnt (point))))
  (slime-pop-find-definition-stack))

(cond
 ((member (upcase (system-name))
	  '("MNASOFT-01" "MNASOFT-00" "MNASOFT-10" "N118383" "N118389" "N132866" "N118665"))
  (load "~/elisp/sly-start.el"))
 ((member (upcase (system-name))
	  '("MNASOFT-PI" "N118944"))
  (load "~/elisp/slime-start.el")))

