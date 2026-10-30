;;;; ~/elisp/gptel-modeles/gemma3-270m.el  -*- lexical-binding: t -*-

(use-package gptel
  :ensure t
  :config
  (setq gptel-backend
        (gptel-make-ollama
         "Ollama"
         :host "localhost:11434"
         :stream t
         :models '(gemma3:270m)))

  (setq gptel-model 'gemma3:270m))

(use-package gptel
  :ensure t
  :config
  (setq gptel-backend
        (gptel-make-ollama
            "Ollama"
          :host "localhost:11434"
          :stream t
          :models '(gemma3:270m)))

  (setq gptel-model 'gemma3:270m)

  (add-to-list
   'gptel-directives
   '(common-lisp
     . "You are an expert Common Lisp programmer.
Use ANSI Common Lisp unless I explicitly request implementation-specific code.
I use SBCL, Quicklisp, ASDF, SLY and Emacs.
Prefer idiomatic Common Lisp.
Do not confuse Common Lisp with Emacs Lisp, Scheme or Clojure.
When explaining code, be concise and technically precise.")))
