;;; ./hide-show-mode.el -*- lexical-binding: t -*-

(defun h-s ()
  (interactive)
  (if hs-minor-mode
      (hs-minor-mode 0)
    (hs-minor-mode 1)))

(add-hook 'prog-mode-hook #'hs-minor-mode)
