;;;; zm-tz-header.el

(defun tz-header ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (goto-char (point-min))
  (newline 2) 
  (end-of-buffer)
  (newline 2)
  (end-of-buffer)
  (delete-blank-lines)
  (beginning-of-line)
  (previous-line 2)
  (while (/= 1 (line-number-at-pos (point))) (delete-indentation))
  (insert "|")
  (next-line)
  (left-char)
  (insert "|")
  (query-replace "\"" ""  nil (point-min) (point-max) )
  (query-replace "\t" "|" nil (point-min) (point-max) )
  (goto-char (point-min))
  (query-replace " " "-"  nil (line-beginning-position) (line-end-position) )
  (query-replace "|" ":|" nil (line-beginning-position) (line-end-position) )
  (goto-char (line-end-position))
  (insert ":")
  (goto-char (line-beginning-position))
  (delete-char 1 )
;;;;  
  (insert "	")
;;;;  
  (org-table-transpose-table-at-point)
  (query-replace " | " "" nil (point-min) (point-max))
  (query-replace "| "  ":" nil (point-min) (point-max))
  (query-replace " |"  "" nil (point-min) (point-max))
  (goto-char (point-min))
  (insert "#+INCLUDE: \"~/org/header/header.org\"") (newline 2)
  (insert ":PROPRETIES:") (newline)
  (goto-char (point-max))
  (insert ":END:"))
	
(defun dos ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (revert-buffer-with-coding-system 'windows-1251 T))

<<<<<<< HEAD
(defun iapws-table ()
  (interactive)
  (let ((point (point)))
    (replace-string " 10" "d" t)
    (goto-char point)))


=======
(defun sp-import ()
  "Импортирование спецификации"
  (interactive)
  (insert "
#+BEGIN_SRC lisp
;;;;(require :exel-read)
(defparameter *sp* (exel-read:r-exel))
*sp*
#+END_SRC")
  (previous-line 3)
  (move-end-of-line nil)
  (org-edit-special)
)
>>>>>>> 0dfd35d212a4bfe5a8b02b7a1c3735d9f157ce6d

