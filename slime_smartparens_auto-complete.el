;;;; ~/elisp/slime_smartparens_auto-complete.el
;;;; https://habr.com/ru/post/259737/

(require 'cl)

(defvar required-packages '(slime
                            smartparens
                            auto-complete))

(defun packages-installed-p ()
  (loop for package in required-packages
        unless (package-installed-p package)
          do (return nil)
	  finally (return t)))

(unless (packages-installed-p)
  (package-refresh-contents)
  (dolist (package required-packages)
    (unless (package-installed-p package)
      (package-install package))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (packages-installed-p)
  (require 'smartparens-config)
  (smartparens-global-mode)

  (require 'auto-complete-config)
  (ac-config-default)
  (global-auto-complete-mode t)
  (setq-default ac-auto-start t)
  (setq-default ac-auto-show-menu t)
  (defvar *sources* (list
                     'lisp-mode
                     'ac-source-semantic
                     'ac-source-functions
                     'ac-source-variables
                     'ac-source-dictionary
                     'ac-source-words-in-all-buffer
                     'ac-source-files-in-current-dir))
  (let (source)
    (dolist (source *sources*)
      (add-to-list 'ac-sources source)))
  (add-to-list 'ac-modes 'lisp-mode)

  (require 'slime)
  (require 'slime-autoloads)
  (slime-setup '(slime-asdf
                 slime-fancy
                 slime-indentation))
  (setq-default slime-net-coding-system 'utf-8-unix))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq-default lisp-body-indent 2)
(setq-default lisp-indent-function 'common-lisp-indent-function)
