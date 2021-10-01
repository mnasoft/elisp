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

(setf comps-sly-common-lisp
      (list "N133907" "N000308" "MNASOFT-01" "mnasoft-00" "MNASOFT-10" "N118383" "N118389" "N132866" "N118665"))
(setf comps-slime-common-lisp
      '("mnasoft-pi"))

(cond
 ((member (upcase (system-name)) comps-sly-common-lisp)
  (load "~/elisp/sly-start.el"))
 ((member (upcase (system-name)) comps-slime-common-lisp)
  (load "~/elisp/slime-start.el")))

