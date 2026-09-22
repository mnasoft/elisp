;;; ./my-minor-mode.el -*- lexical-binding: t -*-
 
(progn
  (defun my/hs-hide-block ()
    (interactive)
    (my-minor-mode 1)
    (hs-minor-mode 1)
    (hs-hide-block))

  (defun my/hs-show-block ()
    (interactive)
    (my-minor-mode 1)
    (hs-minor-mode 1)
    (hs-show-block))

  (defun my/hs-show-all ()
    (interactive)
    (my-minor-mode 1)
    (hs-minor-mode 1)
    (hs-show-all))

  (defun my/hs-hide-all ()
    (interactive)
    (my-minor-mode 1)
    (hs-minor-mode 1)
    (hs-hide-all)))

(defvar my-map (make-sparse-keymap))

(define-minor-mode my-minor-mode
  "Мой режим."
  :lighter " My"
  :keymap my-map)

(progn
  (define-key my-map (kbd "C-c <right>")   #'my/hs-show-block)
  (define-key my-map (kbd "C-c C-<right>") #'my/hs-show-block)
  (define-key my-map (kbd "C-c <left>")    #'my/hs-hide-block)
  (define-key my-map (kbd "C-c C-<left>")  #'my/hs-hide-block)
;;;
  (define-key my-map (kbd "C-c <down>")    #'hs-show-all)
  (define-key my-map (kbd "C-c C-<down>")  #'hs-show-all)
  (define-key my-map (kbd "C-c <up>")      #'hs-hide-all)
  (define-key my-map (kbd "C-c C-<up>")    #'hs-hide-all)
;;;
  (define-key my-map (kbd "C-c e")         #'my/sly-open-last-error))

;; Привязка всего keymap к префиксу C-c m
(define-key global-map (kbd "C-c m") my-map)

(add-hook 'prog-mode-hook #'my-minor-mode)
