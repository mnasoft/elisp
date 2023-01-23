;;;; ./inferior-lisp/N142013.el

;;;;(progn (setq inferior-lisp-program "d:/home/_namatv/PRG/SBCL/2.2.1-msi/sbcl.exe") (sly))
(progn
  (setq sly-lisp-implementations
        '((sbcl ("sbcl" "--dynamic-space-size" "16384"))))
  (setq inferior-lisp-program
        "d:/home/_namatv/PRG/SBCL/2.3.0-msi/sbcl.exe")
  (sly))
;;;; (sly-connect "localhost" 4005)
