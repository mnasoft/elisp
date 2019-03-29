;;;; open-some-files.el

(defun open-main-org ()
  (interactive)
  (find-file "~/org/main.org"))

(defun open-dot-emacs ()
  (interactive)
  (find-file "~/.emacs"))

(defun open-index-org ()
  (interactive)
  (find-file "~/org/index.org"))

(defun open-index-org ()
  (interactive)
  (find-file "~/org/index.org"))

(defun open-common-lisp-projects-org  ()
  (interactive)
  (find-file "~/org/common-lisp-projects.org "))

(defun open-elisp-readme-org ()
  (interactive)
  (find-file "~/elisp/README.org"))

    
(defun open-some-files ()
  (interactive)
  (open-main-org)
  (open-dot-emacs )
  (open-index-org )
  (open-index-org )
  (open-common-lisp-projects-org)
  (open-elisp-readme-org))
