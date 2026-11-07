;;; ~/elisp/themes/themes-loader.el --- Custom themes loader -*- lexical-binding: t; -*-

;; ================================================================
;; Custom themes loader
;; ================================================================

;;(load "~/elisp/themes/color-adjust.el")
;;(load "~/elisp/themes/color-adjust-test.el")

;(require 'warm-day-theme)
;(require 'warm-cloudy-theme)
;(require 'warm-night-theme)

(add-to-list 'custom-theme-load-path
           (expand-file-name "~/elisp/themes"))

;;(load-theme 'warm-night t)

(provide 'warm-themes)
