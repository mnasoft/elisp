;;;; ollama-buddy-setup.el --- Personal Ollama Buddy setup -*- lexical-binding: t; -*-

;;; Code:

(use-package ollama-buddy
  :ensure t
  :bind
  (("C-c o" . ollama-buddy-role-transient-menu)
   ("C-c O" . ollama-buddy-transient-menu))
  :custom
  (ollama-buddy-host "localhost")
  (ollama-buddy-port 11434))

(use-package ollama-buddy-rag
  :after ollama-buddy
  :config
  (dolist (ext '("lisp" "cl" "asd"))
    (add-to-list 'ollama-buddy-rag-file-extensions ext)))

(require 'ollama-buddy--preset__common-lisp)

;; SSH tunnel configured in ~/.ssh/config:
;; ssh -N ollama

(provide 'ollama-buddy-setup)

;;; ollama-buddy-setup.el ends here
