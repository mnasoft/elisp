;;;; ~/elisp/ollama-buddy-setup/ollama-buddy-setup.el  -*- lexical-binding: t; -*-

(use-package ollama-buddy
  :ensure t
  :bind
  ("C-c o" . ollama-buddy-role-transient-menu)
  ("C-c O" . ollama-buddy-transient-menu)
  :custom
  (ollama-buddy-host "192.168.0.140")
  (ollama-buddy-port 11434))

(use-package ollama-buddy-rag
  :after ollama-buddy
  :config
  (dolist (ext '("lisp" "cl" "asd"))
    (add-to-list 'ollama-buddy-rag-file-extensions ext)))

(load "~/elisp/ollama-buddy-setup/ollama-buddy--preset__common-lisp.el")
