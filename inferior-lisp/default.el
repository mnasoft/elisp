;;;; ./inferior-lisp/default.el

;;;; Для создания файла индивидуальных настроек скопируйте содержимое
;;;; настоящего (этого) файла в файл с именем, клторое хранится в
;;;; переменной system-name и расширением el.

;;;; use-sly-connection - позволяет подключить sly к уже работающему
;;;; серверу sbcl (если use-sly-connection имеет значение t) или
;;;; осуществить запуск нового сервера (если use-sly-connection имеет
;;;; значение nil)
(setq use-sly-connection nil)


;;;; Блок кода, осуществляющий подключение sly к sbcl, работающему на
;;;; порту 4005 или запуск нового сервера sbcl.
;;;; Параметры:

;;;; - --dynamic-space-size - предельный размер для пространства нодов
;;;;   в килобайтах;
;;;; - --control-stack-size" - размер стека в килобайтах
(if use-sly-connection
    (sly-connect "localhost" 4005)
  (progn
    (setq sly-lisp-implementations
          '((sbcl ("sbcl"
                   "--dynamic-space-size" "16384"
                   ;; "--control-stack-size" "8192"
                   ))))
    (setq inferior-lisp-program "sbcl" )
    (sly)))

