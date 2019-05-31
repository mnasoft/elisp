;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Slime.  Loading Contrib Packages - START ;;;;;;;;;;;;;
;;(setq slime-contribs '(slime-scratch slime-editing-commands))
;;(setq slime-contribs '(slime-repl))  ; repl only
(setq slime-contribs '(slime-fancy)) ; almost everything
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Slime.  Loading Contrib Packages - STOP ;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SBCL -START ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inferior-lisp-program-name :sbcl)
;;(setq inferior-lisp-program-name :allegro-express)

(when (eq inferior-lisp-program-name :sbcl)
  (cond
   ((string= (upcase (system-name)) "MNASOFT-00")  (setq inferior-lisp-program "/usr/bin/sbcl"))
   ((string= (upcase (system-name)) "KO11-118383") (setq inferior-lisp-program (concat (getenv "MSYS_HOME") "/usr/local/bin/sbcl.exe")))
   ((string= (upcase (system-name)) "MNASOFT-10")  (setq inferior-lisp-program "D:/PRG/msys/usr/local/bin/sbcl.exe"))))

(when (eq inferior-lisp-program-name :allegro-express)
  (cond
;;;; ((string= (system-name) "ko11-118383") (setq inferior-lisp-program "D:/PRG/acl10.1express/allegro-express.exe"))
   ((string= (upcase (system-name)) "KO11-118383") (setq inferior-lisp-program "D:/PRG/acl10.1express/alisp.exe +B +m -e slime"))))

;(setq inferior-lisp-program "D:\\PRG\\ccl\\wx86cl64.exe")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SBCL -STOP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Slime autoload - Start ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(slime)
;; Slime autoload - End ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





