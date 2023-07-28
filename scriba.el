;;;; /home/namatv/elisp/scriba.el

(defun scr-code ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (insert "@begin[lang=lisp](code)

@end(code)
"))

(defun scr-code-lisp ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (insert "@begin[lang=lisp](code)

@end(code)
"))

(defun scr-code-txt ()
  "Предназначена для формирования вставки блока кода"
  (interactive)
  (insert "@begin[lang=txt](code)

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

(defun scr-item ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "
 @item( )
 @item( )
 @item( )
 @item( )
 @item( )
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

(defun scr-deflist-item ()
  "Вставляет элемент списка определений в коротком формате."
  (interactive)
  (insert "@term(...) @def(...)
"))

(defun scr-deflist-item-long ()
  "Вставляет элемент списка определений в длинном формате."
  (interactive)
  (insert "
@term(...)
@begin(def)
...
@end(def)
"))

(defun scr-deflist ()
  "Вставляет элемент списка определений"
  (interactive)
  (insert "@begin(deflist)
")
  (scr-deflist-item)
  (scr-deflist-item)
  (scr-deflist-item)
  (insert "@end(deflist)
"))

(defun scr-section ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@begin(section)
@title( )

@end(section)
"))

(defun scr-doc-function ()
  "Вставляет документацию для function."
  (interactive)
  (insert "@cl:doc(function  ...)")
  (newline 1))

(defun scr-doc-setf-function ()
  "Вставляет документацию для setf-function."
  (interactive)
  (insert "@cl:doc(setf-function ...)")
  (newline 1))

(defun scr-doc-macro ()
  "Вставляет документацию для macro."
  (interactive)
  (insert "@cl:doc(macro ...)")
  (newline 1))

(defun scr-doc-generic ()
  "Вставляет документацию для generic."
  (interactive)
  (insert "@cl:doc(generic ...)")
  (newline 1))

(defun scr-doc-setf-generic ()
  "Вставляет документацию для setf-generic."
  (interactive)
  (insert "@cl:doc(setf-generic ...)")
  (newline 1))

(defun scr-doc-method ()
  "Вставляет документацию для method."
  (interactive)
  (insert "@cl:doc(method ...)")
  (newline 1))

(defun scr-doc-setf-method ()
  "Вставляет документацию для method."
  (interactive)
  (insert "@cl:doc(setf-method ...)")
  (newline 1))

(defun scr-doc-variable ()
  "Вставляет документацию для variable"
  (interactive)
  (insert "@cl:doc(variable ...)")
  (newline 1))

(defun scr-doc-struct ()
  "Вставляет документацию для "
  (interactive)
  (insert "@cl:doc(struct ...)")
  (newline 1))

(defun scr-doc-class ()
  "Вставляет документацию для class."
  (interactive)
  (insert "@cl:doc(class ...)")
  (newline 1))

(defun scr-doc-condition ()
  "Вставляет документацию для condition."
  (interactive)
  (insert "@cl:doc(condition ...)")
  (newline 1))

(defun scr-doc-type ()
  "Вставляет документацию для type."
  (interactive)
  (insert "@cl:doc(type ...)")
  (newline 1))

(defun scr-doc-cfunction ()
  "Вставляет документацию для cfunction."
  (interactive)
  (insert "@cl:doc(cfunction ...)")
  (newline 1))

(defun scr-doc-ctype ()
  "Вставляет документацию для "
  (interactive)
  (insert "@cl:doc(ctype ...)")
  (newline 1))

(defun scr-doc-cstruct ()
  "Вставляет документацию для cstruct."
  (interactive)
  (insert "@cl:doc(cstruct ...)")
  (newline 1))

(defun scr-doc-cunion ()
  "Вставляет документацию для cunion."
  (interactive)
  (insert "@cl:doc(cunion ...)")
  (newline 1))

(defun scr-doc-cenum ()
  "Вставляет документацию для cenum."
  (interactive)
  (insert "@cl:doc(cenum ...)")
  (newline 1))

(defun scr-doc-cbitfield ()
  "Вставляет документацию для cbitfield."
  (interactive)
  (insert "@cl:doc(cbitfield ...)")
  (newline 1))

(defun scr-doc ()
  "Вставляет секцию документации."
  (interactive)
  (insert "@cl:with-package[name=\"pkg-name\"](")
  (newline 1)
  (scr-doc-function)
  (scr-doc-setf-function)
  (scr-doc-macro)
  (scr-doc-generic)
  (scr-doc-setf-generic)
  (scr-doc-method)
  (scr-doc-setf-method)
  (scr-doc-variable)
  (scr-doc-struct)
  (scr-doc-class)
  (scr-doc-condition)
  (scr-doc-type)

  (scr-doc-cfunction)
  (scr-doc-ctype)
  (scr-doc-cstruct)
  (scr-doc-cunion)
  (scr-doc-cenum)
  (scr-doc-cbitfield)
  (insert ")")
  (newline 1))

(defun scr-description ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@b(Описание:) функция|метод|обобщенная_функция| @b(...)")
  (newline 1))

(defun scr-variables ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "
 @b(Переменые:)")
  (newline 1)
  (scr-list))

(defun scr-example ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (newline 1)
  (insert " @b(Пример использования:)")
  (newline 1)
  (scr-code))

(defun scr-return ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@b(Возвращает:)
"))

(defun scr-link-external ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@link[uri=\"https://www.google.com/\"](Google)"))

(defun scr-link-external-line ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (beginning-of-line)
  (insert "@link[uri=\\\"")
  (end-of-line)
  (insert "\\\"]()"))

(defun scr-link-internal ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@ref[id=data-table-3](table)"))

(defun scr-link-internal-ref ()
  "Предназначена для формирования заголовка технического задания"
  (interactive)
  (insert "@begin[ref=data-table-3](table)
@row(@cell(@b(A)) @cell(@b(B)) @cell(@b(C)))
@row(@cell(1.23) @cell(3.14) @cell(4.5))
@end(table)"))

(defun loop-hash-keys-using ()
  (interactive)
  (insert "(loop :for k :being :the hash-keys :in hash-table :using (hash-value v) :do
    (list k v))"))

