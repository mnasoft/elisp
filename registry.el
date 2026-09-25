;;; ~/elisp/registry.el -*- lexical-binding: t -*-

(defun my-reg-query (key value)
  "Получить VALUE из раздела реестра KEY."
  (with-temp-buffer
    (let ((coding-system-for-read 'cp866)) ;; windows-1251 cp866
      (let ((status
             (call-process "reg.exe" nil t nil
                           "query" key "/v" value)))
        (if (zerop status)
            (progn
              (goto-char (point-min))
              (when (re-search-forward
                     (concat "^[ \t]*"
                             (regexp-quote value)
                             "[ \t]+REG_[A-Z0-9_]+[ \t]+\\(.*\\)$")
                     nil t)
                (string-trim (match-string 1))))
          (error "Не удалось прочитать реестр: %s" key))))))
