;;;; SLY-AUTOLOAD-START
(sly)
;;;; SLY-AUTOLOAD-END

(setq org-babel-lisp-eval-fn 'sly-eval)

(cond
 ((string= (upcase (system-name)) "MNASOFT-00")
  (add-to-list 'load-path "~/quicklisp/dists/quicklisp/software/cl-annot-20150608-git/misc/")) 
 ((string= (upcase (system-name)) "N118383")
  (add-to-list 'load-path "d:/PRG/msys32/home/namatv/quicklisp/dists/quicklisp/software/cl-annot-20150608-git/misc/")))

(require 'sly-annot)

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
