;;; ...  -*- lexical-binding: t -*-
;;;; /home/mna/elisp/global-set-key.el

(global-set-key (kbd "C-x C-d") (lambda () (interactive) (insert "°")))

(global-set-key (kbd "C-x C-'") (lambda () (interactive) (insert "′")))

(global-set-key (kbd "C-x C-\"") (lambda () (interactive) (insert "″")))

(global-set-key (kbd "C-x C-,") (lambda () (interactive) (insert "□°′″")))

(global-set-key (kbd "C-x C-/") (lambda () (interactive) (insert "?")))

(global-set-key (kbd "C-x C-.") (lambda () (interactive) (insert "?")))

(global-set-key (kbd "C-c r") #'my/replace-in-files-silently)

(global-set-key (kbd "C-c n") #'numbering)
