;;; yes-or-no-p.el --- Use y/n for confirmation prompts -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Mykola Matvyeyev

;; Author: Mykola Matvyeyev <mnasoft@gmail.com>
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.1"))
;; Keywords: convenience

;;; Commentary:

;; This package changes `yes-or-no-p' confirmation prompts to use
;; the shorter `y-or-n-p' interface.
;;
;; Instead of typing "yes" or "no", a confirmation can be answered
;; with a single "y" or "n" keystroke.
;;
;; Usage:
;;
;;   (require 'yes-or-no-p)

;;; Code:

(defalias 'yes-or-no-p #'y-or-n-p)

(provide 'yes-or-no-p)
;;; yes-or-no-p.el ends here
