;;; ...  -*- lexical-binding: t -*-

;;;; SLY-AUTOLOAD-START
;(sly)
;;;; SLY-AUTOLOAD-END

(setq org-babel-lisp-eval-fn 'sly-eval)

(defun sly-compile-all ()
  "Выполняет переоценку и перекомпилирование открытого буфера"
  (interactive)
  (beginning-of-buffer)
  (let ((pnt (point)))
    (while (< pnt (progn (forward-list) (point)))
      (sly-eval-last-expression)
      (sly-compile-defun)
      (setq pnt (point))))
  (sly-pop-find-definition-stack))

(defun s-c ()
  "Выполняет переоценку и перекомпилирование открытого буфера"
  (interactive)  
  (sly-compile-all))

(defun sly-r ()
  "Выполняет перезапуск лиспа"
  (interactive)
  (sly-restart-inferior-lisp))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my/sly-open-last-error ()
  "Jump to file/line of last SBCL error in *sly-mrepl for sbcl*."
  (interactive)
  (let ((buf (get-buffer "*sly-mrepl for sbcl*")))
    (unless buf
      (user-error "Buffer *sly-mrepl for sbcl* not found"))
    (with-current-buffer buf
      (save-excursion
        (goto-char (point-max))

        (let (line col file)

          ;; --- Вариант 1: формат SBCL "(in form starting at line: NNN)"
          (when (re-search-backward
                 "(in form starting at line: \\([0-9]+\\)" nil t)
            (setq line (string-to-number (match-string 1))))

          ;; --- Вариант 2: формат "Line: NNN, Column: CCC"
          (when (re-search-backward
                 "Line: \\([0-9]+\\), Column: \\([0-9]+\\)" nil t)
            (setq line (string-to-number (match-string 1)))
            (setq col  (string-to-number (match-string 2))))

          ;; --- Ищем путь к файлу (универсально)
          (goto-char (point-max))
          (when (re-search-backward
                 "file \\([^\"\n]+\\.lisp\\)" nil t)
            (setq file (match-string 1)))

          (if (and file line)
              (progn
                (find-file file)
                (goto-char (point-min))
                (forward-line (1- line))
                (when col (forward-char col)))
            (message "Не удалось найти описание ошибки")))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key (kbd "C-c e") #'my/sly-open-last-error)

