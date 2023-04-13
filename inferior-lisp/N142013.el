;;;; ./inferior-lisp/N142013.el

(setq use-sly-connection nil)

(if use-sly-connection
    (sly-connect "localhost" 4005)
  (progn
    (setq sly-lisp-implementations
          '((sbcl ("sbcl" "--dynamic-space-size" "16384"))))
    (setq inferior-lisp-program
          "d:/home/_namatv/PRG/SBCL/2.3.2-msi/sbcl.exe")
    ;;  "d:/home/_namatv/PRG/SBCL/2.2.1-msi/sbcl.exe"
    (sly)))
