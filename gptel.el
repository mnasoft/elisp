;;; ./gptel.el  -*- lexical-binding: t -*-

;; (load "~/elisp/gptel-modeles/gemma3-270m.el")
(load "~/elisp/gptel-modeles/qwen2.5-coder-7b.el")

(with-eval-after-load 'lisp-mode
  (define-key lisp-mode-map
              (kbd "C-c g r")
              #'gptel-rewrite))
