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

