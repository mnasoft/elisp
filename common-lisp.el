;;;; common-lisp.el

;;(setq slime-contribs '(slime-scratch slime-editing-commands))
;;(setq slime-contribs '(slime-repl))  ; repl only
(setq slime-contribs '(slime-fancy)) ; almost everything

;;;; SLIME-LOADING-CONTRIB-PACKAGES-STOP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; SLIME-AUTOLOAD-START
;;(slime)
;;;; SLIME-AUTOLOAD-END

(load "~/.quicklisp/clhs-use-local.el" 'noerror)
(load "~/.quicklisp/clhs-use-local.el" t)
;;;;(load "D:/PRG/msys32/home/namatv/quicklisp/clhs-use-local.el" t

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;  (slime-edit-definition)

(cond
       ((string= (upcase (system-name)) "MNASOFT-01" ) (load "~/elisp/sly-start.el")) 
       ((string= (upcase (system-name)) "MNASOFT-00" ) (load "~/elisp/sly-start.el")) 
       ((string= (upcase (system-name)) "MNASOFT-10" ) (load "~/elisp/sly-start.el")) 
       ((string= (upcase (system-name)) "MNASOFT-PI" ) (load "~/elisp/slime-start.el"))
       ((string= (upcase (system-name)) "N118383")     (load "~/elisp/sly-start.el")) 
       ((string= (upcase (system-name)) "N132866")     (load "~/elisp/sly-start.el"))        
       ((string= (upcase (system-name)) "N118944")     (load "~/elisp/slime-start.el")) 
       )
;;;;

