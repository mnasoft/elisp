;;; neotree-setup.el --- Personal NeoTree configuration -*- lexical-binding: t; -*-

;; Author: Mykola
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1") (neotree "0.5.2"))
;; Keywords: convenience, files

;;; Commentary:

;; Personal NeoTree configuration.
;;
;; Enables `neo-smart-open' and binds F8 to `neotree-toggle'.
;;
;; Usage:
;;
;;   (require 'neotree-setup)

;;; Code:

(require 'neotree)

(setq neo-smart-open t)

(global-set-key (kbd "<f8>") #'neotree-toggle)

(provide 'neotree-setup)

;;; neotree-setup.el ends here
