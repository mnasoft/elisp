;;;; ~/elisp/main.el

(setf comps-sbcl-inferior-lisp-program
      '("N142013" "N000308" "MNASOFT-01"
	"MNASOFT-00" "MNASOFT-10"  "N118389"
	"N118944" "N118665"))

(setf comps-ccl-inferior-lisp-program
      '("N000308" "MNASOFT-01" "MNASOFT-00"
	"MNASOFT-10"  "N118389"
	"N118944" "N118665"))

(setf comps-sly-common-lisp
      (list "N142013" "N000308" "MNASOFT-01"
	    "mnasoft-00" "MNASOFT-10"
	     "N118389" "N132866" "N118665"))

(setf comps-with-shell
      '("N142013" "N000308"  "N118389" "N118944" "N118665"
	"mnasoft-00" "MNASOFT-01" "mnasoft-pi" "N132849" ))

(setf comps-slime-common-lisp
      '("mnasoft-pi"))

(load "~/elisp/org-code.el")
(load "~/elisp/org-babel-do-load-languages.el") 
(load "~/elisp/kill-some-buffers.el")
(load "~/elisp/zm-tz-header.el")
(load "~/elisp/open-some-files.el")
(load "~/elisp/translate-commands-gr-ru-uk.el")
(load "~/elisp/hide-show-mode.el")
(load "~/elisp/gnuplot.el")
(load "~/elisp/scriba.el")
(load "~/elisp/org-structure.el")
(load "~/elisp/annotation.el")
(load "~/elisp/hunspell.el")
(load "~/elisp/yes-or-no-p.el")
(load "~/elisp/neotree.el")

(load "~/elisp/inferior-lisp-program.el")
(load "~/elisp/common-lisp.el")


;;;; (load "~/elisp/elgrep.el")

;;;;(load "~/elisp/annot.el")
;;;;(load "~/elisp/slime_smartparens_auto-complete.el")
;;;;(load "~/elisp.config/mnas-publish")

;(setq process-connection-type nil)
;(desktop-save-mode 1)
;(set-default 'truncate-lines t)

(setq-default indent-tabs-mode nil)
(set-default 'truncate-lines t)
