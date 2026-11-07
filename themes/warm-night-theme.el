;;; warm-night-theme.el --- Warm light nighttime theme -*- lexical-binding: t; -*-

(require 'color-adjust)

(deftheme
    warm-night  "Warm light theme for nighttime use."
    :family 'warm
    :kind 'color-scheme
    :background-mode 'light)

(let* ((saturate  75)
       (c-fg     -50)
       (c-bg     -10)
       (bg      (color-adjust-lighten  "#f1e5cf" c-bg))
       (bg-alt  (color-adjust-lighten  "#e5d6bd" c-bg))
       (fg      (color-adjust-lighten  "#40372f" c-fg))
       (fg-dim  (color-adjust-lighten  "#766d64" c-fg))
       (red     (color-adjust-saturate "#a6534c" saturate))
       (green   (color-adjust-saturate "#66805c" saturate))
       (yellow  (color-adjust-lighten  "#a47a3f" -100))
       (blue    (color-adjust-saturate "#607c8c" saturate))
       (magenta (color-adjust-saturate "#826b85" saturate))
       (cyan    (color-adjust-saturate "#5f8580" saturate))
       (orange  (color-adjust-saturate "#9b653d" saturate))
       (select  (color-adjust-lighten  "#d8c4a6" 00)))
  (custom-theme-set-faces 'warm-night
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

(provide-theme 'warm-night)
;;(provide 'warm-night-theme)
;;; warm-night-theme.el ends here
