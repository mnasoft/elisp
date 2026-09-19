;;; ./global-set-key.el -*- lexical-binding: t -*-

(global-set-key (kbd "C-x C-d")  (lambda () (interactive) (insert "°")))
(global-set-key (kbd "C-x C-'")  (lambda () (interactive) (insert "′")))
(global-set-key (kbd "C-x C-\"") (lambda () (interactive) (insert "″")))
(global-set-key (kbd "C-x C-,")  (lambda () (interactive) (insert "□°′″")))
(global-set-key (kbd "C-x C-/")  (lambda () (interactive) (insert "?")))
(global-set-key (kbd "C-x C-.")  (lambda () (interactive) (insert "?")))
(global-set-key (kbd "C-c r") #'my/replace-in-files-silently)
(global-set-key (kbd "C-c n") #'numbering)

(global-set-key (kbd "C-c k f") #'my/save-and-kill-all-file-buffers)
(global-set-key (kbd "C-c k n") #'my/kill-non-file-buffers-except-sly)
;;;;

;;;;
(global-set-key [f8] 'neotree-toggle)
;;;;

