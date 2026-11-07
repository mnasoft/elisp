;;; scriba.el --- Helpers for editing Scriba markup -*- lexical-binding: t; -*-

;; Author: Mykola
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1"))
;; Keywords: convenience, docs

;;; Commentary:

;; Interactive commands for inserting frequently used Scriba markup,
;; including code blocks, lists, sections, links and Common Lisp
;; documentation directives.

;;; Code:

(defun scriba-code-lisp ()
  "Insert a Lisp code block."
  (interactive)
  (insert "@begin[lang=lisp](code)\n\n@end(code)\n"))

(defun scriba-code-text ()
  "Insert a plain text code block."
  (interactive)
  (insert "@begin[lang=txt](code)\n\n@end(code)\n"))

(defun scriba-code ()
  "Insert a Lisp code block."
  (interactive)
  (scriba-code-lisp))

(defun scriba-list ()
  "Insert a Scriba list."
  (interactive)
  (insert "@begin(list)\n @item( )\n @item( )\n@end(list)\n"))

(defun scriba-item ()
  "Insert several Scriba list items."
  (interactive)
  (insert "\n @item( )\n @item( )\n @item( )\n @item( )\n @item( )\n"))

(defun scriba-enum ()
  "Insert an example enumerated list."
  (interactive)
  (insert "@begin(enum)\n@item(The first item.)\n@item(The second item.)\n@item(Third.)\n@end(enum)\n"))

(defun scriba-deflist-item ()
  "Insert a short definition-list item."
  (interactive)
  (insert "@term(...) @def(...)\n"))

(defun scriba-deflist-item-long ()
  "Insert a long definition-list item."
  (interactive)
  (insert "\n@term(...)\n@begin(def)\n...\n@end(def)\n"))

(defun scriba-deflist ()
  "Insert a definition list containing three items."
  (interactive)
  (insert "@begin(deflist)\n")
  (dotimes (_ 3) (scriba-deflist-item))
  (insert "@end(deflist)\n"))

(defun scriba-section ()
  "Insert a section skeleton."
  (interactive)
  (insert "@begin(section)\n@title( )\n\n@end(section)\n"))

(defun scriba--insert-cl-doc (type)
  "Insert a Common Lisp documentation directive for TYPE."
  (insert (format "@cl:doc(%s ...)\n" type)))

(defmacro scriba--define-doc-command (name type description)
  "Define NAME to insert a CL doc entry for TYPE with DESCRIPTION."
  `(defun ,name ()
     ,description
     (interactive)
     (scriba--insert-cl-doc ,type)))

(scriba--define-doc-command scriba-doc-function "function" "Insert documentation for a function.")
(scriba--define-doc-command scriba-doc-setf-function "setf-function" "Insert documentation for a SETF function.")
(scriba--define-doc-command scriba-doc-macro "macro" "Insert documentation for a macro.")
(scriba--define-doc-command scriba-doc-generic "generic" "Insert documentation for a generic function.")
(scriba--define-doc-command scriba-doc-setf-generic "setf-generic" "Insert documentation for a SETF generic function.")
(scriba--define-doc-command scriba-doc-method "method" "Insert documentation for a method.")
(scriba--define-doc-command scriba-doc-setf-method "setf-method" "Insert documentation for a SETF method.")
(scriba--define-doc-command scriba-doc-variable "variable" "Insert documentation for a variable.")
(scriba--define-doc-command scriba-doc-struct "struct" "Insert documentation for a structure.")
(scriba--define-doc-command scriba-doc-class "class" "Insert documentation for a class.")
(scriba--define-doc-command scriba-doc-condition "condition" "Insert documentation for a condition.")
(scriba--define-doc-command scriba-doc-type "type" "Insert documentation for a type.")
(scriba--define-doc-command scriba-doc-cfunction "cfunction" "Insert documentation for a C function.")
(scriba--define-doc-command scriba-doc-ctype "ctype" "Insert documentation for a C type.")
(scriba--define-doc-command scriba-doc-cstruct "cstruct" "Insert documentation for a C structure.")
(scriba--define-doc-command scriba-doc-cunion "cunion" "Insert documentation for a C union.")
(scriba--define-doc-command scriba-doc-cenum "cenum" "Insert documentation for a C enum.")
(scriba--define-doc-command scriba-doc-cbitfield "cbitfield" "Insert documentation for a C bitfield.")

(defun scriba-doc ()
  "Insert a skeleton Common Lisp documentation section."
  (interactive)
  (insert "@cl:with-package[name=\"pkg-name\"](\n")
  (dolist (type '("function" "setf-function" "macro" "generic" "setf-generic"
                  "method" "setf-method" "variable" "struct" "class" "condition"
                  "type" "cfunction" "ctype" "cstruct" "cunion" "cenum" "cbitfield"))
    (scriba--insert-cl-doc type))
  (insert ")\n"))

(defun scriba-description ()
  "Insert a description template."
  (interactive)
  (insert "@b(Описание:) функция|метод|обобщенная_функция| @b(...)\n"))

(defun scriba-variables ()
  "Insert a variables section."
  (interactive)
  (insert "\n @b(Переменые:)\n")
  (scriba-list))

(defun scriba-example ()
  "Insert an example-usage section."
  (interactive)
  (insert "\n @b(Пример использования:)\n")
  (scriba-code))

(defun scriba-return ()
  "Insert a return-value heading."
  (interactive)
  (insert "@b(Возвращает:)\n"))

(defun scriba-link-external (url text)
  "Insert an external Scriba link to URL with visible TEXT."
  (interactive
   (list (read-string "URL: " "https://www.google.com/")
         (read-string "Текст ссылки: " "Google")))
  (insert (format "@link[uri=\"%s\"](%s)" url text)))

(defun scriba-link-external-line ()
  "Turn the current line into the URL part of a Scriba link template."
  (interactive)
  (beginning-of-line)
  (insert "@link[uri=\"")
  (end-of-line)
  (insert "\"]()"))

(defun scriba-link-internal ()
  "Insert an internal Scriba reference."
  (interactive)
  (insert "@ref[id=data-table-3](table)"))

(defun scriba-link-internal-ref ()
  "Insert a table carrying an internal reference identifier."
  (interactive)
  (insert "@begin[ref=data-table-3](table)\n@row(@cell(@b(A)) @cell(@b(B)) @cell(@b(C)))\n@row(@cell(1.23) @cell(3.14) @cell(4.5))\n@end(table)"))

(defun scriba-insert-cl-loop-hash-keys ()
  "Insert a Common Lisp LOOP example for hash keys and values."
  (interactive)
  (insert "(loop :for k :being :the hash-keys :in hash-table :using (hash-value v) :do\n    (list k v))"))

(provide 'scriba)

;;; scriba.el ends here
