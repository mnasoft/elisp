;;;; ~/elisp/tcl-helper.el

(defun find-proc-string-with-cursorf ()
  (interactive)
  (re-search-forward "^\\s-*proc "))

(defun th-description-header ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (find-proc-string-with-cursor)
  (setq p1 (point))
  (re-search-forward "} {$")
  (setq p2 (point))
  (kill-ring-save p1 (- p2 2))
  (previous-line)
  (move-end-of-line 1)
  (newline)
  (insert "## - =")
  (yank 1)
  (insert "= :: Возвращает ..."))


(defun th-description ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (th-description-header)
  (th-variables)
  (th-example))
 
(defun th-h1 ()
 (interactive)
 (move-end-of-line  1)
 (newline)
 (insert "## * "))

(defun th-h2 ()
 (interactive)
 (move-end-of-line  1)
 (newline)
 (insert "## ** "))

(defun th-h3 ()
 (interactive)
 (move-end-of-line  1)
 (newline)
 (insert "## *** "))

(defun th-h4 ()
 (interactive)
 (move-end-of-line  1)
 (newline)
 (insert "## **** "))

(defun th-h5 ()
 (interactive)
 (move-end-of-line  1)
 (newline)
 (insert "## ***** "))

(defun th-h6 ()
 (interactive)
 (move-end-of-line  1)
 (newline)
 (insert "## ****** "))

(defun th-indentation ()
 (interactive)
 (move-beginning-of-line 1)
 (insert "## ")
 (next-line))

(defun th-unindentation ()
 (interactive)
 (move-beginning-of-line 1)
 (insert "## ")
 (next-line))

(defun th-p ()
  (interactive)
  (th-line)
  (th-line))

(defun th-src ()
  (interactive)
  (th-line)
  (insert "#+begin_src tcl")
  (th-line)
  (th-line)
  (insert "#+end_src")
  (previous-line))

(defun th-example ()
  (interactive)
  (th-p)
  (insert "Пример использования:")
  (th-src))


(defun th-variables ()
  (interactive)
  (th-p)
  (insert "Аргументы:")
  (th-line)
  (insert "- ")
  (th-line)
  (insert "- "))

(defun th-line ()
 (interactive)
 (move-end-of-line  1)
 (newline)
 (insert "##   "))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



 proc mk_abc_letters { } {
