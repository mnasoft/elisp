;;;; ~/elisp/main.el

;(setq process-connection-type nil)
;(desktop-save-mode 1)
;(set-default 'truncate-lines t)

(setq-default indent-tabs-mode nil)
(set-default 'truncate-lines t)

(setq ispell-program-name "aspell")

;;;; gpg --homedir ~/.emacs.d/elpa/gnupg --receive-keys 066DAFCB81E42C40
;;;; (setq package-check-signature nil)
(setq package-gnupghome-dir (concat "/home/" (getenv "USER") "/.emacs.d/elpa/gnupg"))

(global-company-mode 1)

(defun numbering ()
  (interactive)
  (insert (what-line)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/elisp/directory.el")
(load "~/elisp/org-code.el")
(load "~/elisp/org-babel-do-load-languages.el") 
(load "~/elisp/kill-some-buffers.el")
(load "~/elisp/zm-tz-header.el")
(load "~/elisp/open-some-files.el")
(load "~/elisp/translate-commands-gr-ru-uk.el")
(load "~/elisp/hide-show-mode.el")
(load "~/elisp/gnuplot.el")
(load "~/elisp/scriba.el")
(load "~/elisp/org-structure.el")
(load "~/elisp/annotation.el")
(load "~/elisp/hunspell.el")
(load "~/elisp/yes-or-no-p.el")
(load "~/elisp/tcl-helper.el")
(load "~/elisp/neotree.el")
(load "~/elisp/tcl-helper.el")

(load "~/elisp/inferior-lisp-program.el")
(load "~/elisp/common-lisp.el")

(global-set-key (kbd "C-x C-d")  (lambda () (interactive) (insert "°")))
(global-set-key (kbd "C-x C-'")  (lambda () (interactive) (insert "′")))
(global-set-key (kbd "C-x C-\"") (lambda () (interactive) (insert "″")))
(global-set-key (kbd "C-x C-,")  (lambda () (interactive) (insert "□°′″")))

(global-set-key (kbd "C-x C-/")  (lambda () (interactive) (insert "?")))
(global-set-key (kbd "C-x C-.")  (lambda () (interactive) (insert "?")))



(defun parent-directory (n)
  "Возвращает каталог предка определенного уровня для текущего файлового
буфера. 0 - текущий каталог; 1 - родительский; 2 - дедовский."
    (let ((p (file-name-directory (buffer-file-name))))
      (dotimes (i n)
        (setf p (file-name-directory
                 (directory-file-name p))))
      p))
