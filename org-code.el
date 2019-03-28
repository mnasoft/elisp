;;;; org-code.el

(defun org-code-elisp ()
  "Заготовка кода для elisp"
  (interactive)
  (insert "#+name: foo ")
  (newline)
  (insert "#+begin_src elisp")
  (newline 2)
  (insert "#+end_src")
  (previous-line)
  )

(defun org-code-lisp ()
  "Заготовка кода для lisp"
  (interactive)
  (insert "#+name: foo")
  (newline)
  (insert "#+begin_src lisp")
  (newline 2)
  (insert "#+end_src")
  (previous-line)
  )

(defun b-name ()
  "Вставляет имя текущего буфера"
  (interactive)
  (insert (concat "[[" (buffer-file-name) "]]")))

(defun org-header ()
  "Вставляет ссылку на заголовчный файл"
  (interactive)
  (insert (concat "#+INCLUDE: \"~/org/header/header.org\"")))

