;;;; ~/elisp/hide-show-mode.el

(defun h-s ()
  (interactive)
  (hs-minor-mode 1)
  ;;(add-hook 'prog-mode-hook #'hs-minor-mode)

  (global-set-key (kbd "C-c <right>")   'hs-show-block)
  (global-set-key (kbd "C-c C-<right>") 'hs-show-block)
  (global-set-key (kbd "C-c <left>")    'hs-hide-block)
  (global-set-key (kbd "C-c C-<left>")  'hs-hide-block)

  (global-set-key (kbd "C-c <down>")   'hs-show-all)
  (global-set-key (kbd "C-c C-<down>") 'hs-show-all)
  (global-set-key (kbd "C-c <up>")     'hs-hide-all)
  (global-set-key (kbd "C-c C-<up>")   'hs-hide-all))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
