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
(load "~/elisp/file-apps.el")
(load "~/elisp/lang-utf-8.el")


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

(defun my/sly-open-last-error ()
  (interactive)
  (let* ((buf (get-buffer "*sly-mrepl for sbcl*")))
    (unless buf
      (error "Буфер *sly-mrepl for sbcl* не найден"))
    (switch-to-buffer buf)
    (goto-char (point-max))

    ;; 1. Ищем строку ошибки "(in form starting at line: NNN"
    (unless (re-search-backward
             "(in form starting at line: \\([0-9]+\\)" nil t)
      (error "Не удалось найти строку ошибки SBCL"))

    (let ((line (string-to-number (match-string 1))))
      ;; 2. Ищем строку с файлом: "file /path/to/file.lisp"
      (unless (re-search-backward
               "\"file \\([^\"]+\\.lisp\\)\"" nil t)
        (error "Не удалось найти путь к файлу"))

      (let ((file (match-string 1)))
        ;; 3. Открываем файл и прыгаем на строку
        (find-file file)
        (goto-char (point-min))
        (forward-line (1- line))))))

;(defun my/sly-open-last-error ()
;  (interactive)
;  (let* ((buf (get-buffer "*sly-mrepl for sbcl*")))
;    (unless buf
;      (error "Буфер *sly-mrepl for sbcl* не найден"))
;    (switch-to-buffer buf)
;    (goto-char (point-max))
;
;    (let (file line)
;
;      ;; --- Формат №1 ---
;      ;; "file /path/file.lisp"
;      ;; (in form starting at line: NNN)
;      (save-excursion
;        (when (re-search-backward
;               "(in form starting at line: \\([0-9]+\\)" nil t)
;         (setq line (string-to-number (match-string 1)))
;          (when (re-search-backward
;                 "\"file \\([^\"]+\\.lisp\\)\"" nil t)
;            (setq file (match-string 1)))))
;
;      ;; --- Формат №2 ---
;      ;; Line: NNN
;      ;; Stream: #<... "file /path/file.lisp">
;      (unless (and file line)
;        (save-excursion
;          (when (re-search-backward
;                 "Line: \\([0-9]+\\)" nil t)
;            (setq line (string-to-number (match-string 1)))
;            (when (re-search-forward
;                   "\"file \\([^\"]+\\.lisp\\)\"" nil t)
;             (setq file (match-string 1))))))
;
;      ;; Если всё ещё нет — ошибка
;      (unless (and file line)
;        (error "Не удалось найти ошибку с файлом и строкой"))
;
;      ;; Открываем файл и прыгаем на строку
;      (find-file file)
;      (goto-char (point-min))
;      (forward-line (1- line)))))


(global-set-key (kbd "C-c e") #'my/sly-open-last-error)
