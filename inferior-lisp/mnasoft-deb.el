;;;; ./inferior-lisp/mnasoft-deb.el

(setq use-sly-connection nil)

(if use-sly-connection
    (sly-connect "localhost" 4005)
  (progn
    (setq sly-lisp-implementations '((sbcl ("sbcl" "--dynamic-space-size" "2048"))))
    (setq inferior-lisp-program "/usr/bin/sbcl")
    ;;(setq inferior-lisp-program "~/ccl-dev/lx86cl64")
    ;;(setq inferior-lisp-program "/usr/bin/clisp")
    ;;(setq inferior-lisp-program "/usr/bin/ecl")
    (sly)))
