;;;; org-babel-do-load-languages.el

(require 'package)
;;;;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(setq package-archive-priorities nil)
(add-to-list 'package-archive-priorities '("org" . 5))
(add-to-list 'package-archive-priorities '("melpa" . 4))
(add-to-list 'package-archive-priorities '("built-in" . 3))

;; List of additional LaTeX packages
(require 'org)
(add-to-list 'org-latex-default-packages-alist '("" "cmap" t))
(add-to-list 'org-latex-default-packages-alist '("english,russian" "babel" t))
(add-to-list 'org-latex-default-packages-alist '("left=2.5cm,right=1.0cm,top=1.5cm,bottom=2.5cm" "geometry" nil))

(setq org-latex-compiler "Lualatex")

;;(setq org-latex-packages-alist nil)
;;(add-to-list 'org-latex-packages-alist '("margin=1cm" "geometry" nil))
;;(add-to-list 'org-latex-packages-alist '("left=2.5cm,right=1.0cm,top=1.5cm,bottom=2.5cm" "geometry" nil))

;;;; #+LATEX_CLASS: article
;;;; #+LATEX_CLASS_OPTIONS: [a4paper,14pt,twoside]{extarticle}

;;#+LATEX_HEADER: \addtolength{\textwidth}{3in}
;;#+LATEX_HEADER: \addtolength{\hoffset}{-2in}
;;#+LATEX_HEADER: \addtolength{\voffset}{-1in}

(cond
 ((member system-name 
	  '("N133907" "N000308" "N118383" "N118389" "N118944" "N118665" "mnasoft-00" "MNASOFT-01" "mnasoft-pi" "N132849" ))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((ditaa   . t)
     (dot     . t)
     (gnuplot . t)
     (lisp    . t)
     (shell   . t)
     )))
 (t (org-babel-do-load-languages
     'org-babel-load-languages
     '((ditaa   . t)
       (dot     . t)
       (gnuplot . t)
       (lisp    . t)
       (sh      . t)
       ))))

;; Фрагмент Latex большего размера
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.75))

