;;;; /home/namatv/elisp/scriba.el

(defun scr-code ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (insert "@begin[lang=lisp](code)

@end(code)
"))

(defun scr-list ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@begin(list)
 @item( )
 @item( )
@end(list)
"))

(defun scr-enum ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@begin(enum)
@item(The first item.)
@item(The second item.)
@item(Third.)
@end(enum)
"))

(defun scr-deflist ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@begin(deflist)

@term(VerTeX)
@def(A markup language with text syntax.)

@term(Scriba)
@begin(def)
A markup language with Scribe syntax.

As you can see, you can use regular tags and begin/end ones interchangeably.
@end(def)

@end(deflist)
"))

(defun scr-section ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@begin(section)
@title( )

@end(section)
"))

(defun scr-doc ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:with-package[name=\"pkg-name\"](
@cl:doc(function  ...)
@cl:doc(macro     ...)
@cl:doc(generic   ...)
@cl:doc(method    ...)
@cl:doc(variable  ...)
@cl:doc(struct    ...)
@cl:doc(class     ...)
@cl:doc(condition ...)
@cl:doc(type      ...)

@cl:doc(cfunction ...)
@cl:doc(ctype     ...)
@cl:doc(cstruct   ...)
@cl:doc(cunion    ...)
@cl:doc(cenum     ...)
@cl:doc(cbitfield ...)
)
"))

(defun scr-doc-function ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(function  ...)
"))

(defun scr-doc-macro ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(macro     ...)
"))

(defun scr-doc-generic ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(generic   ...)
"))

(defun scr-doc-method ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(method    ...)
"))

(defun scr-doc-variable ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(variable  ...)"))

(defun scr-doc-struct ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(struct    ...)"))

(defun scr-doc-class ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(class     ...)"))

(defun scr-doc-condition ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(condition ...)"))

(defun scr-doc-type ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(type      ...)"))


(defun scr-doc-cfunction ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(cfunction ...)
"))

(defun scr-doc-ctype ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(ctype     ...)
"))

(defun scr-doc-cstruct ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(cstruct   ...)
"))

(defun scr-doc-cunion ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(cunion    ...)
"))

(defun scr-doc-cenum ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(cenum     ...)
"))

(defun scr-doc-cbitfield ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@cl:doc(cbitfield ...)
"))

(defun scr-description ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@b(Описание:)
"))

(defun scr-variables ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@b(Переменые:)
"))

(defun scr-example ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@b(Пример использования:)
"))

(defun scr-return ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@b(Возвращает:)
"))
