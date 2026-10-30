;;;; ~/elisp/gptel-modeles/qwen2.5-coder-7b.el -*- lexical-binding: t -*-

(use-package gptel
  :ensure t
  :config
  (setq gptel-backend
        (gptel-make-ollama
         "Ollama"
         :host "localhost:11434"
         :stream t
         :models '(qwen2.5-coder:7b)))

  (setq gptel-model 'qwen2.5-coder:7b)

  (add-to-list
   'gptel-directives
   '(common-lisp
     . "You are an expert Common Lisp programmer.
Use ANSI Common Lisp unless implementation-specific code is requested.
The Lisp implementation is SBCL.
The development environment uses ASDF, Quicklisp, SLY and Emacs.
Prefer idiomatic Common Lisp.
Do not confuse Common Lisp with Emacs Lisp, Scheme or Clojure.
Be concise and technically precise.")))
