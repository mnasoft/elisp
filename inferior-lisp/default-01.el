;;;; ./inferior-lisp/default.el

;;;; Для создания файла индивидуальных настроек скопируйте содержимое
;;;; настоящего (этого) файла в файл с именем, клторое хранится в
;;;; переменной system-name и расширением el.

;;;; use-sly-connection - позволяет подключить sly к уже работающему
;;;; серверу sbcl (если use-sly-connection имеет значение t) или
;;;; осуществить запуск нового сервера (если use-sly-connection имеет
;;;; значение nil)
(setq use-sly-connection t)

;;;; sly-port - port to use as the default for ‘sly-connect’.
(setq sly-port 4005)
;;;; sly-lisp-implementations - определяет параметры запуска sly
;;;; Параметры:
;;;; - --dynamic-space-size - предельный размер для пространства нодов
;;;;   в килобайтах;
;;;; - --control-stack-size" - размер стека в килобайтах
(setq sly-lisp-implementations
       '((sbcl ("sbcl"
                "--dynamic-space-size" "16384"
                ;; "--control-stack-size" "8192"
                ))))

;;;; inferior-lisp-program - лисп-программа 
(setq inferior-lisp-program "sbcl")

;;;; Блок кода, осуществляющий подключение sly к sbcl, работающему на
;;;; порту sly-port или запуск нового сервера sbcl.

(if use-sly-connection (sly-connect "localhost" sly-port) (sly))

