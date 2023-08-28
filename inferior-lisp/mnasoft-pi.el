
(if t
    (progn
      (setq sly-lisp-implementations '((sbcl ("sbcl" "--dynamic-space-size" "1024"))))
      (setq inferior-lisp-program "/usr/local/bin/sbcl")
      (sly))
  (sly-connect "localhost" 4005))
