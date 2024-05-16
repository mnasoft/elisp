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
  "Вставляет полный путь к текущему буферу"
  (interactive)
  (insert (concat "[[" (buffer-file-name) "]]")))

(defun b-r-name ()
  "Вставляет путь к текущему буферу относительно домашнего каталога"
  (interactive)
  (insert (concat ";;;; ~/" (get-relative-path (buffer-file-name)))))

(defun org-header ()
  "Вставляет ссылку на заголовчный файл"
  (interactive)
  (insert (concat "#+INCLUDE: \"~/org/header/header.org\"")))

(defun tcl-msg (msg)
  (b-name)
  (search-backward "/")
  (right-char)
  (kill-line)
  (move-beginning-of-line 1)
  (yank)
  (left-char 2)
  (kill-line)
  (insert "\"")
  (move-beginning-of-line 1)
  (insert "mess \"source ")
  (move-end-of-line 1)
  (left-char)
  (insert " ")
  (insert msg)
  (move-end-of-line 1))

(defun tcl-start ()
  (interactive)
  (tcl-msg "START... \\n"))

(defun tcl-finish ()
  (interactive)
  (tcl-msg "FINISH. \\n"))
