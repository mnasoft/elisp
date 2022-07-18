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
 ((member (upcase (system-name)) comps-sly-common-lisp)
  (load "~/elisp/sly-start.el"))
 ((member (upcase (system-name)) comps-slime-common-lisp)
  (load "~/elisp/slime-start.el")))

