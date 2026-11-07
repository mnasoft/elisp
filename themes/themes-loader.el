;;; ~/elisp/themes/themes-loader.el --- Custom themes loader -*- lexical-binding: t; -*-

;; ================================================================
;; Custom themes loader
;; ================================================================

(load "~/elisp/themes/color-adjust.el")

(add-to-list 'custom-theme-load-path
             (expand-file-name "~/elisp/themes"))

(load-theme 'warm-night t)

