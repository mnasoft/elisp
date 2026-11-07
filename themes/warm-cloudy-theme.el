;;; warm-cloudy-theme.el --- Warm cloudy theme -*- lexical-binding: t; -*-

(provide 'color-adjust)

(deftheme warm-cloudy "Warm muted theme for cloudy weather."
          :family 'warm
          :kind 'color-scheme
          :background-mode 'dark)

(let ((bg       "#3b3732")
      (bg-alt   "#46413b")
      (fg       "#e5ddd1")
      (fg-dim   "#a99f94")
      (red      "#bd7068")
      (green    "#849276")
      (yellow   "#c39a65")
      (blue     "#78929d")
      (magenta  "#9b8295")
      (cyan     "#789c96")
      (orange   "#dbad72")
      (select   "#5d554c"))
  (custom-theme-set-faces 'warm-cloudy
   `(default ((t (:background ,bg :foreground ,fg))))
   `(cursor ((t (:background ,orange))))
   `(fringe ((t (:background ,bg :foreground ,fg-dim))))
   `(region ((t (:background ,select))))
   `(highlight ((t (:background ,bg-alt))))
   `(minibuffer-prompt ((t (:foreground ,cyan :weight bold))))
   `(font-lock-builtin-face ((t (:foreground ,magenta))))
   `(font-lock-comment-face ((t (:foreground ,fg-dim :slant italic))))
   `(font-lock-constant-face ((t (:foreground ,cyan))))
   `(font-lock-function-name-face ((t (:foreground ,blue :weight bold))))
   `(font-lock-keyword-face ((t (:foreground ,yellow :weight bold))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,cyan))))
   `(font-lock-variable-name-face ((t (:foreground ,fg))))
   `(font-lock-warning-face ((t (:foreground ,red :weight bold))))
   `(link ((t (:foreground ,blue :underline t))))
   `(error ((t (:foreground ,red :weight bold))))
   `(warning ((t (:foreground ,yellow :weight bold))))
   `(success ((t (:foreground ,green :weight bold))))
   `(mode-line ((t (:background ,select :foreground ,fg :box nil))))
   `(mode-line-inactive ((t (:background ,bg-alt :foreground ,fg-dim :box nil))))
   `(show-paren-match ((t (:background ,green :foreground ,bg :weight bold))))
   `(show-paren-mismatch ((t (:background ,red :foreground ,bg :weight bold))))))

(provide-theme 'warm-cloudy)
;;(provide 'warm-cloudy-theme)
;;; warm-cloudy-theme.el ends here
