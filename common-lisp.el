;;;; SLIME-LOADING-CONTRIB-PACKAGES-START 

;;(setq slime-contribs '(slime-scratch slime-editing-commands))
;;(setq slime-contribs '(slime-repl))  ; repl only
(setq slime-contribs '(slime-fancy)) ; almost everything

;;;; SLIME-LOADING-CONTRIB-PACKAGES-STOP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; INFERIOR-LISP-PROGRAM-START

;;(setq inferior-lisp-program-name :sbcl)
;;(setq inferior-lisp-program-name :ccl)
;;(setq inferior-lisp-program-name :allegro-express)
;;(setq inferior-lisp-program-name :ecl)

(cond
 ((string= (upcase (system-name)) "MNASOFT-00" ) (setq inferior-lisp-program-name :sbcl))
 ((string= (upcase (system-name)) "KO11-118383") (setq inferior-lisp-program-name :sbcl))
 ((string= (upcase (system-name)) "MNASOFT-10" ) (setq inferior-lisp-program-name :sbcl))
 ((string= (upcase (system-name)) "MNASOFT-PI" ) (setq inferior-lisp-program-name :ccl)))

(when (eq inferior-lisp-program-name :sbcl)
  (cond
   ((string= (upcase (system-name)) "MNASOFT-00" ) (setq inferior-lisp-program "sbcl"))
   ((string= (upcase (system-name)) "KO11-118383") (setq inferior-lisp-program (concat (getenv "MSYS_HOME") "/usr/local/bin/sbcl.exe")))
   ((string= (upcase (system-name)) "MNASOFT-10" ) (setq inferior-lisp-program "D:/PRG/msys/usr/local/bin/sbcl.exe"))
   ((string= (upcase (system-name)) "MNASOFT-PI" )
    (setq inferior-lisp-program "/usr/local/bin/sbcl")
;;;;(setq inferior-lisp-program "/usr/bin/sbcl")
    )))

(when (eq inferior-lisp-program-name :ecl)
  (cond
   ((string= (upcase (system-name)) "MNASOFT-00")  (setq inferior-lisp-program "ecl"))))

(when (eq inferior-lisp-program-name :allegro-express)
  (cond
;;;; ((string= (system-name) "ko11-118383") (setq inferior-lisp-program "D:/PRG/acl10.1express/allegro-express.exe"))
   ((string= (upcase (system-name)) "KO11-118383") (setq inferior-lisp-program "D:/PRG/acl10.1express/alisp.exe +B +m -e slime"))))

(when (eq inferior-lisp-program-name :ccl)
  (cond
   ((string= (upcase (system-name)) "MNASOFT-PI") (setq inferior-lisp-program "/usr/local/bin/ccl"))))

;;;;(setq inferior-lisp-program "D:\\PRG\\ccl\\wx86cl64.exe")

;;;; INFERIOR-LISP-PROGRAM-STOP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; SLIME-AUTOLOAD-START
;;(slime)
;;;; SLIME-AUTOLOAD-END





