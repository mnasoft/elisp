;;;; /home/namatv/elisp/annotation.el



(defun ann-enable ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (insert "(annot:enable-annot-syntax)

"))

(defun ann-export ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (insert "@export
"))

(defun ann-doc ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (insert "@annot.doc:doc
"))

(defun ann-ignore ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (insert "@ignore (   )
"))

(defun ann-type ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (insert "@type integer v
"))

(defun ann-accessors ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (insert "@annot.class:export-accessors
"))

(defun ann-slots ()
  "Предназначена для формирования вставки блока кода
 @export-slots
 (defclass foo ()
   (bar baz))
 (progn
   (export '(bar baz))
   (defclass foo ()
      (bar baz)))"
  (interactive)
  (insert "@annot.class:export-slots
"))

(defun ann-class ()
  "Предназначена для формирования вставки блока кода
 @export-slots
 (defclass foo ()
   (bar baz))
 (progn
   (export '(bar baz))
   (defclass foo ()
      (bar baz)))"
  (interactive)
  (insert "@annot.class:export-class
"))

(defun ann-accessors ()
  "Предназначена для формирования вставки блока кода
 @export-accessors
           (defclass c ()
                ((a :reader a-of)
                 (b :writer b-of)
                 (c :accessor c-of)))
           (progn
             (export '(a-of b-of c-of))
             (defclass c ()
                ((a :reader a-of)
                 (b :writer b-of)
                 (c :accessor c-of))))"
  (interactive)
  (insert "@annot.class:export-accessors
"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ann-rm-export ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (let ((s-pos 0) (e-pos))
    (search-forward "@export")
    (move-beginning-of-line 1)
    (insert "(")
    (delete-forward-char 1)
    (move-end-of-line 1)
    (insert " '")
    (next-line 1)
    (move-beginning-of-line 1)
    (search-forward " ")
    (setf s-pos (point))
    (search-forward "(")
    (left-char 1)
    (setf e-pos (point))
    (kill-ring-save s-pos e-pos)
    (move-end-of-line 0)
    (yank)
    (insert ")")))

(defun ann-rm-doc ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (let ((s-pos 0) (e-pos))
    (search-forward "@doc")
    (move-beginning-of-line 1)
    (kill-line 1)
    (setf s-pos (point))
    (search-forward "(def")
    (move-beginning-of-line 1)
    (setf e-pos (point))
    (kill-region s-pos e-pos)
    (right-char 1)
    (forward-list 1)
    (newline 1)
    (yank)
    (delete-blank-lines)
    (delete-blank-lines)
    ))


