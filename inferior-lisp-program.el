;;;; inferior-lisp-program.el

;;;; Если существует файл с индивидуальными параметрами запуска SBCL
;;;; загружаем его. Иначе загружаем файл с начтройками по умолчанию.
(if (file-exists-p (concat  "~/elisp/inferior-lisp" "/" system-name ".el"))
    (load (concat  "~/elisp/inferior-lisp" "/" system-name ".el")) ;; Загружаем файл с индивидуальными параметрами запуска SBCL
  (load (concat  "~/elisp/inferior-lisp/default.el")) ;; Загружаем файл с параметрами запуска SBCL по умолчанию
  ) 
      

