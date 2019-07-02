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

;; bigger latex fragment
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.75))
(set-default 'truncate-lines t)





(hs-minor-mode)
;;(add-hook 'prog-mode-hook #'hs-minor-mode)
(global-set-key (kbd "C-c <right>") 'hs-show-block)
(global-set-key (kbd "C-c <left>")  'hs-hide-block)

(global-set-key (kbd "C-c <down>")  'hs-show-all)
(global-set-key (kbd "C-c <up>")    'hs-hide-all)

;;C-c @ C-a	hs-show-all
;;C-c @ C-c	hs-toggle-hiding
;;C-c @ C-d	hs-hide-block
;;C-c @ C-e	hs-toggle-hiding
;;C-c @ C-h	hs-hide-block
;;C-c @ C-l	hs-hide-level
;;C-c @ C-s	hs-show-block
;;C-c @ C-t	hs-hide-all
;;C-c @ ESC	Prefix Command

;;C-c @ C-M-h	hs-hide-all
;;C-c @ C-M-s	hs-show-all
