;;;; org-babel-do-load-languages.el

(require 'package)
;;;;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(setq package-archive-priorities nil)
(add-to-list 'package-archive-priorities '("org" . 5))
(add-to-list 'package-archive-priorities '("melpa" . 4))
(add-to-list 'package-archive-priorities '("built-in" . 3))

;; List of additional LaTeX packages
(add-to-list 'org-export-latex-packages-alist '("" "cmap" t))
(add-to-list 'org-export-latex-packages-alist '("english,russian" "babel" t))
          
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa   . t)
   (dot     . t)
   (gnuplot . t)
   (lisp    . t)
   (shell   . t)))

