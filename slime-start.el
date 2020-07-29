;;;; SLIME-LOADING-CONTRIB-PACKAGES-START 

;;(setq slime-contribs '(slime-scratch slime-editing-commands))
;;(setq slime-contribs '(slime-repl))  ; repl only
(setq slime-contribs '(slime-fancy)) ; almost everything

;;;; SLIME-LOADING-CONTRIB-PACKAGES-STOP

;;;; SLIME-AUTOLOAD-START
(slime)
;;;; SLIME-AUTOLOAD-END

(setq org-babel-lisp-eval-fn 'slime-eval)

(add-to-list 'load-path "~/quicklisp/dists/quicklisp/software/cl-annot-20150608-git/misc/")

(require 'slime-annot)

(load "~/.quicklisp/clhs-use-local.el" 'noerror)
(load "~/.quicklisp/clhs-use-local.el" t)
;;;;(load "D:/PRG/msys32/home/namatv/quicklisp/clhs-use-local.el" t

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun slime-compile-all ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (beginning-of-buffer)
  (let ((pnt (point)))
    (while (< pnt (progn (forward-list) (point)))
      (slime-eval-last-expression)
      (slime-compile-defun)
      (setq pnt (point))))
  (slime-pop-find-definition-stack))

;;  (slime-edit-definition)

(defun s-r ()
  (interactive)
  (slime-restart-inferior-lisp)
  (k-b))
