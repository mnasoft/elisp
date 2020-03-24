;;;; SLY-AUTOLOAD-START
(sly)
;;;; SLY-AUTOLOAD-END

(setq org-babel-lisp-eval-fn 'sly-eval)

(defun sly-compile-all ()
  "Выполняет переоценку и перекомпилирование открытого буфера"
  (interactive)
  (beginning-of-buffer)
  (let ((pnt (point)))
    (while (< pnt (progn (forward-list) (point)))
      (sly-eval-last-expression)
      (sly-compile-defun)
      (setq pnt (point))))
  (sly-pop-find-definition-stack))

(defun s-c ()
  "Выполняет переоценку и перекомпилирование открытого буфера"
  (interactive)  
  (sly-compile-all))

(defun s-r ()
  (interactive)
  (sly-restart-inferior-lisp)
  (k-b))
