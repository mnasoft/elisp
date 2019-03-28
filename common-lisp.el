
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SBCL -START ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(cond
;;  ((file-exists-p (concat (getenv "SBCL_HOME") "\\sbcl.exe"))
;;   (setq inferior-lisp-program (concat (getenv "SBCL_HOME") "\\sbcl.exe")))
;;  (t (message "Не могу найти файл %s. Переменная inferior-lisp-program не определена в файле %s"
;;	      (concat (getenv "SBCL_HOME") "\\sbcl.exe")
;;	      (buffer-name))))

(setq inferior-lisp-program (concat (getenv "MSYS_HOME") "/usr/local/bin/sbcl.exe"))

;(setq inferior-lisp-program "D:\\PRG\\ccl\\wx86cl64.exe")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SBCL -STOP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Slime.  Loading Contrib Packages - START ;;;;;;;;;;;;;
;;(setq slime-contribs '(slime-scratch slime-editing-commands))
;;(setq slime-contribs '(slime-repl))  ; repl only
(setq slime-contribs '(slime-fancy)) ; almost everything
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; slime.  loading contrib packages - STOP ;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Slime autoload - Start 
(slime)
;; Slime autoload - End
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
