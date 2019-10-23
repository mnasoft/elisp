;;;; ~/elisp/main.el

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Neotree. START ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Neotree. STOP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Elgrep. START ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'elgrep)
;;(global-set-key [f5] 'elgrep)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Elgrep. STOP  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;; change all prompts to y or n - Start ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(fset 'yes-or-no-p 'y-or-n-p)
;;;;;;;;;;;;;;;;;;;; change all prompts to y or n - End ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use pipes for subprocess communication. START ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq process-connection-type nil)
;; Use pipes for subprocess communication. STOP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/elisp/common-lisp.el")
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

;;;; (load "~/elisp/slime_smartparens_auto-complete.el")


;; bigger latex fragment
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.75))
(set-default 'truncate-lines t)

(desktop-save-mode nil)
;;;;(desktop-change-dir "~/")
