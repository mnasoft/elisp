
(defun lisp-inferior-lisp-program (lisp-prg)
  (if (first (member lisp-prg '( :ccl :sbcl))) ;; :abcl :clisp :ecl
      (setq inferior-lisp-program-name lisp-prg)
    (cond
     ((member (upcase system-name) system-name-with-windows) (setq inferior-lisp-program-name :sbcl))
     ((member system-name '("MNASOFT-PI"))
      (setq inferior-lisp-program-name :ccl))
     (t (setq inferior-lisp-program-name :sbcl))))
;;;;
  (progn
    (when (eq inferior-lisp-program-name :sbcl)
      (cond
       ((member (upcase system-name) system-name-with-windows)
        (setq inferior-lisp-program (concat (getenv "SBCL_PATH") "/" (getenv "SBCL_BIN"))))
       ((string= (upcase (system-name)) "MNASOFT-00")
        (setq inferior-lisp-program "sbcl"))       
       ((string= (upcase (system-name)) "MNASOFT-PI")
        (setq inferior-lisp-program "/usr/local/bin/sbcl"))
       (t (setq inferior-lisp-program "/usr/bin/sbcl"))))
    (when (eq inferior-lisp-program-name :ccl)
      (cond
       ((string= (upcase (system-name)) "MNASOFT-PI")
        (setq inferior-lisp-program "/usr/local/bin/ccl"))))
    inferior-lisp-program))

;;(setq inferior-lisp-program-name :abcl)
;;(setq inferior-lisp-program-name :allegro-express)
;;(setq inferior-lisp-program-name :ccl)
;;(setq inferior-lisp-program-name :clisp)
;;(setq inferior-lisp-program-name :ecl)
;;(setq inferior-lisp-program-name :sbcl)

;;(lisp-inferior-lisp-program :ccl)
;;(lisp-inferior-lisp-program nil)
(sly-connect "localhost" 4005)

;;(setq sly-lisp-implementations
;;     '((sbcl ("d:/PRG/msys64/mingw64/bin/sbcl.exe") :coding-system utf-8-unix)
;;        (ccl  ("d:/PRG/msys64/usr/local/src/ccl/wx86cl64.exe") :coding-system utf-8-unix)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Добавьте нечто подобное в .bash_profile для работы с MSYS2
;;
;; SBCL_ROOT="/d/PRG/SBCL/2.1.9"
;; SBCL_BIN="sbcl.exe"
;; SBCL_EXE=`find ${SBCL_ROOT} -name "sbcl.exe"`
;; SBCL_PATH=`dirname $SBCL_EXE`
;; SBCL_CORE=`find ${SBCL_ROOT} -name "sbcl.core"`
;; SBCL_HOME=`dirname $SBCL_CORE`
;; # Set SBCL_HOME if it exists
;; if [ -f $SBCL_PATH/$SBCL_BIN ]
;; then
;;     export PATH=${SBCL_PATH}:${PATH}
;;     export SBCL_HOME=$SBCL_HOME
;;     export SBCL_PATH=$SBCL_PATH
;;     export SBCL_BIN=$SBCL_BIN
;; fi
;; echo "SBCL_BIN=$SBCL_BIN"
;; echo "SBCL_PATH=$SBCL_PATH"
;; echo "SBCL_HOME=$SBCL_HOME"
;; echo "PATH=$PATH"
;; echo "===================="
