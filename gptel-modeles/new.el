;;;; ~/elisp/gptel-modeles/qwen2.5-coder-7b.el -*- lexical-binding: t -*-
;; -*- lexical-binding: t; -*-

;; ==================================================================
;; gptel
;; ==================================================================

(use-package gptel
  :ensure t
  :config

  ;; ----------------------------------------------------------------
  ;; General
  ;; ----------------------------------------------------------------

  (setq gptel-use-curl t)


  ;; ----------------------------------------------------------------
  ;; Ollama
  ;; ----------------------------------------------------------------

  (defvar my/gptel-ollama
    (gptel-make-ollama
        "Ollama"
      :host "localhost:11434"
      :protocol "http"
      :models '(qwen2.5-coder:14b
                qwen2.5-coder:7b
                qwen3:30b
                beam:cloud)))

  ;; Default backend/model
  (setq gptel-backend my/gptel-ollama
        gptel-model 'qwen2.5-coder:14b)


  ;; ----------------------------------------------------------------
  ;; Directives
  ;; ----------------------------------------------------------------

  ;; Common Lisp
  (add-to-list
   'gptel-directives
   '(common-lisp
     . "You are an expert Common Lisp programmer.
Use ANSI Common Lisp unless I explicitly request implementation-specific code.
I use SBCL, Quicklisp, ASDF, SLY and Emacs.
Prefer idiomatic Common Lisp.
Do not confuse Common Lisp with Emacs Lisp, Scheme or Clojure.
When explaining code, be concise and technically precise."))


  ;; Emacs Lisp
  (add-to-list
   'gptel-directives
   '(emacs-lisp
     . "You are an expert Emacs Lisp programmer.
Use modern, idiomatic Emacs Lisp.
I use GNU Emacs with lexical-binding, use-package, Org mode and SLY.
Prefer built-in Emacs facilities unless an external package provides a clear advantage.
Do not confuse Emacs Lisp with Common Lisp, Scheme or Clojure.
When providing configuration examples, prefer code suitable for init.el or use-package.
When explaining code, be concise and technically precise."))


  ;; Linux / Arch Linux
  (add-to-list
   'gptel-directives
   '(linux
     . "You are an expert Linux system administrator.
I primarily use Arch Linux and systemd.
Prefer commands and solutions appropriate for Arch Linux.
Use pacman for official packages and mention AUR helpers only when appropriate.
Prefer standard command-line tools and systemd utilities.
When suggesting commands that modify the system, explain briefly what they do.
Clearly indicate commands that require root privileges.
When troubleshooting, prefer diagnostic commands before destructive actions.
Be concise and technically precise."))


  ;; Bash
  (add-to-list
   'gptel-directives
   '(bash
     . "You are an expert Bash and Unix shell programmer.
I primarily use Bash on Arch Linux.
Write portable Bash when practical, and clearly indicate Bash-specific features.
Prefer simple, readable shell commands and scripts.
Use standard Unix command-line tools when appropriate.
Quote variables correctly and handle filenames containing spaces safely.
Prefer arrays over unsafe word splitting when working with lists.
Use shellcheck-friendly practices.
For scripts, use an appropriate shebang and consider `set -euo pipefail` only when its behavior is appropriate.
When troubleshooting, explain errors and provide minimal diagnostic commands.
Clearly indicate commands that modify or delete files or require root privileges.
Be concise and technically precise.")))


;; ==================================================================
;; gptel model switching
;; ==================================================================

(defun my/gptel-beam ()
  "Switch gptel to beam:cloud."
  (interactive)
  (setq gptel-backend my/gptel-ollama
        gptel-model 'beam:cloud)
  (message "gptel -> beam:cloud"))


(defun my/gptel-qwen ()
  "Switch gptel to qwen3:30b."
  (interactive)
  (setq gptel-backend my/gptel-ollama
        gptel-model 'qwen3:30b)
  (message "gptel -> qwen3:30b"))


(defun my/gptel-coder-7b ()
  "Switch gptel to qwen2.5-coder:7b."
  (interactive)
  (setq gptel-backend my/gptel-ollama
        gptel-model 'qwen2.5-coder:7b)
  (message "gptel -> qwen2.5-coder:7b"))


(defun my/gptel-coder-14b ()
  "Switch gptel to qwen2.5-coder:14b."
  (interactive)
  (setq gptel-backend my/gptel-ollama
        gptel-model 'qwen2.5-coder:14b)
  (message "gptel -> qwen2.5-coder:14b"))

(defun my/gptel-select-directive ()
  "Select a gptel directive."
  (interactive)
  (let* ((name
          (completing-read
           "gptel directive: "
           (mapcar (lambda (x)
                     (symbol-name (car x)))
                   gptel-directives)
           nil t))
         (directive
          (alist-get (intern name) gptel-directives)))
    (setq gptel--system-message directive)
    (message "gptel directive -> %s" name)))

(defun my/gptel-directive-by-major-mode ()
  "Return gptel directive according to current major mode."
  (let ((directive
         (cond
          ((derived-mode-p 'emacs-lisp-mode)
           'emacs-lisp)

          ((derived-mode-p 'lisp-mode)
           'common-lisp)

          ((derived-mode-p 'sh-mode)
           'bash)

          (t
           'default))))
    (alist-get directive gptel-directives)))

;; ==================================================================
;; gptel key bindings
;; ==================================================================

(global-set-key (kbd "C-c g d") #'my/gptel-select-directive)
(global-set-key (kbd "C-c g D") #'my/gptel-current-directive)

(global-set-key (kbd "C-c g 7") #'my/gptel-coder-7b)
(global-set-key (kbd "C-c g 1") #'my/gptel-coder-14b)
(global-set-key (kbd "C-c g q") #'my/gptel-qwen)
(global-set-key (kbd "C-c g b") #'my/gptel-beam)

(global-set-key (kbd "C-c g c") #'gptel)
(global-set-key (kbd "C-c g s") #'gptel-send)
(global-set-key (kbd "C-c g r") #'gptel-rewrite)
(global-set-key (kbd "C-c g m") #'gptel-menu)

(setq-default gptel--system-message
              #'my/gptel-directive-by-major-mode)
