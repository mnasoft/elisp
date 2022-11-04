;;;; ~/elisp/main.el


'(("Ванцовський Володимир Григорович" "n133875")
  ("Зінченко Тетяна Юріївна" "n000330")
  ("Давлеткужин Сергій Вікторович" "n133905")
  ("Іванов Максим Валерійович" "n133906")
  ("Головерда Олег Петрович" "n000325")
  ("Рябов Дмитро Володимирович" "n132866")
  ("Тройнич Ірина Павлівна" "n000339")
  ("Гришина Олена Володимирівна" "n000327")
  ("Петельчиц Анатолій Володимирович" "n142012")
  ("Коротич Євген Вікторович" "n000465")
  ("Банкулова Галина Олександрівна" "n118957")
  ("Півень Євген Миколайович" "n000466")
  ("Федоров Олександр Миколайович" "n133148")
  ("Матвєєв Микола Анатолійович" "n142013"))

(setf comps-sbcl-inferior-lisp-program
      '("N142013" "N133906"  "MNASOFT-01"
	"MNASOFT-00" "MNASOFT-10"  
	 ))

(setf comps-ccl-inferior-lisp-program
      '( "MNASOFT-01" "MNASOFT-00"
	"MNASOFT-10"  
	 ))

(setf comps-sly-common-lisp
      (list "N142013" "N133906"  "MNASOFT-01"
	    "mnasoft-00" "MNASOFT-10"
	      "N132866" ))

(setf comps-with-shell
      '("N142013" "N133906"     
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
(global-company-mode 1)
