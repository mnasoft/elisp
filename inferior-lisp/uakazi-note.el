
(if t
    (progn
      (setq sly-lisp-implementations '((sbcl ("sbcl" "--dynamic-space-size" "4096"))))
      (setq inferior-lisp-program "sbcl.exe")
;;      "D:/PRG/SBCL/2.3.2-msi/sbcl.exe"
      (sly))
  (sly-connect "localhost" 4005))
