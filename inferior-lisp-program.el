;;;; inferior-lisp-program.el
;;;; INFERIOR-LISP-PROGRAM-START

(defun lisp-inferior-lisp-program (lisp-prg)
  (if (first (member lisp-prg '(:abcl :ccl :clisp :ecl :sbcl)))
      (setq inferior-lisp-program-name lisp-prg)
    (cond
     ((member (upcase system-name)
	      '("MNASOFT-01" "MNASOFT-00" "MNASOFT-10" "N118383" "N118389" "N118944" "N118665"))
      (setq inferior-lisp-program-name :sbcl))
     ((member system-name '("MNASOFT-PI"))
      (setq inferior-lisp-program-name :ccl))
     (t (setq inferior-lisp-program-name :sbcl))))
;;;;
  (progn
    (when (eq inferior-lisp-program-name :abcl)
      (cond
       ((string= (upcase (system-name)) "MNASOFT-01" ) (setq inferior-lisp-program "D:/PRG/msys64/mingw64/bin/sbcl.exe"))
       ((string= (upcase (system-name)) "MNASOFT-00" ) (setq inferior-lisp-program "abcl"))
       ((string= (upcase (system-name)) "N118383")     (setq inferior-lisp-program (concat (getenv "MSYS_HOME") "/usr/local/bin/sbcl.exe")))
       ((string= (upcase (system-name)) "MNASOFT-10" ) (setq inferior-lisp-program "D:/PRG/msys/usr/local/bin/sbcl.exe"))
       ((string= (upcase (system-name)) "MNASOFT-PI" ) (setq inferior-lisp-program "/usr/local/bin/sbcl"))
       (t (setq inferior-lisp-program "/usr/bin/sbcl"))))
;;;;
    (when (eq inferior-lisp-program-name :sbcl)
      (cond
       ((string= (upcase (system-name)) "N118383")     (setq inferior-lisp-program "D:/PRG/msys32/mingw32/bin/sbcl.exe")) 
       ((string= (upcase (system-name)) "N118944")     (setq inferior-lisp-program "D:/PRG/msys2/usr/local/bin/sbcl.exe"))
       ((string= (upcase (system-name)) "N118665")     (setq inferior-lisp-program "D:/home/PRG/msys32/mingw32/bin/sbcl"))
       ((string= (upcase (system-name)) "N118389")     (setq inferior-lisp-program "D:/home/PRG/msys32/mingw32/bin/sbcl"))
       ((string= (upcase (system-name)) "MNASOFT-10" ) (setq inferior-lisp-program "D:/PRG/msys/usr/local/bin/sbcl.exe"))       
	   ((string= (upcase (system-name)) "MNASOFT-01" ) (setq inferior-lisp-program "D:/PRG/msys64/mingw64/bin/sbcl.exe"))
       ((string= (upcase (system-name)) "MNASOFT-00" ) (setq inferior-lisp-program "sbcl"))       
       ((string= (upcase (system-name)) "MNASOFT-PI" ) (setq inferior-lisp-program "/usr/local/bin/sbcl"))
       (t (setq inferior-lisp-program "/usr/bin/sbcl"))))

    (when (eq inferior-lisp-program-name :ecl)
      (cond
       ((string= (upcase (system-name)) "MNASOFT-00")  (setq inferior-lisp-program "ecl"))))

    (when (eq inferior-lisp-program-name :allegro-express)
      (cond
;;;; ((string= (system-name) "ko11-118383") (setq inferior-lisp-program "D:/PRG/acl10.1express/allegro-express.exe"))
       ((string= (upcase (system-name)) "N118383") (setq inferior-lisp-program "D:/PRG/acl10.1express/alisp.exe +B +m -e slime"))))

    (when (eq inferior-lisp-program-name :ccl)
      (cond
       ((string= (upcase (system-name)) "MNASOFT-00") (setq inferior-lisp-program "ccl"))
       ((string= (upcase (system-name)) "MNASOFT-01") (setq inferior-lisp-program "d:/PRG/msys64/usr/local/src/ccl/wx86cl64.exe"))
       ((string= (upcase (system-name)) "MNASOFT-PI") (setq inferior-lisp-program "/usr/local/bin/ccl"))))

    (when (eq inferior-lisp-program-name :clisp)
      (cond
       ((string= (upcase (system-name)) "MNASOFT-00" ) (setq inferior-lisp-program "clisp"))
       ((string= (upcase (system-name)) "MNASOFT-PI") (setq inferior-lisp-program "/usr/local/bin/ccl"))))
    inferior-lisp-program))

;;(setq inferior-lisp-program-name :abcl)
;;(setq inferior-lisp-program-name :allegro-express)
;;(setq inferior-lisp-program-name :ccl)
;;(setq inferior-lisp-program-name :clisp)
;;(setq inferior-lisp-program-name :ecl)
;;(setq inferior-lisp-program-name :sbcl)

;;(lisp-inferior-lisp-program :ccl) 
(lisp-inferior-lisp-program nil)

;;(setq sly-lisp-implementations
;;     '((sbcl ("d:/PRG/msys64/mingw64/bin/sbcl.exe") :coding-system utf-8-unix)
;;        (ccl  ("d:/PRG/msys64/usr/local/src/ccl/wx86cl64.exe") :coding-system utf-8-unix)))
        
;;;; INFERIOR-LISP-PROGRAM-STOP
