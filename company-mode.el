;;;; ../company-mode.el -*- lexical-binding: t -*-

(use-package company
  :ensure t
  :init
  (global-company-mode 1)
  :config
  (setq company-idle-delay 0.0
        company-minimum-prefix-length 1
        company-tooltip-align-annotations t
        company-backends '(company-capf company-files))

  (define-key company-active-map (kbd "TAB") #'company-complete-common)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
