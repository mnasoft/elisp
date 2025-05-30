;;;; ~/elisp/directory.el

(require 'cl-lib)

(defun get-relative-path (full-path)
  "Возвращает путь к файлу относительно домашнего аталога
 пользователя."
  (let ((home-directory (expand-file-name "~")))
    (file-relative-name full-path home-directory)))

(defun get-ancestor-directory-name (path level)
  "Возвращает имя родительского каталога определенного уровня level
для пути path."
  (let ((current-path (directory-file-name (file-name-directory path))))
    (dotimes (i level)
      (setq current-path (directory-file-name (file-name-directory current-path))))
    current-path))

(defun home-ancestor (level)
  "Возвращает путь к текущену файловому буферу отосительно домашнего
каталога пользователя к родительскому каталогу уровня level."
  (get-ancestor-directory-name
   (get-relative-path
    (buffer-file-name))
   level))

(defun remove-n-parents-from-path (path n)
  "Удаляет из пути определенное количество родителей."
  (let ((components (split-string path "/" t )))
    (mapconcat 'identity (nthcdr n components) "/")))

(cl-defun directory-sleshed (directory)
  "Удаляет лишние слеш или добавляет слеш."
  (concat (directory-file-name directory) "/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cl-defun org-pub-list (name path
                             &key
                             (with-toc        nil)
                             (section-numbers nil)
                             (headline-levels 3)
                             (html-preamble   t)
                             (html-head       "<link rel=\"stylesheet\" href=\"../other/mystyle.css\" type=\"text/css\"/>")
                             (exclude         "ToDo.org")
                             (recursive       nil))
  " Возвращает список, предназначенный для вставки в переменную
org-publish-project-alist (определяющую параметры вывода org-файлов
в html).
Глобальные переменные:
- prj-root - должна указывать на каталог проекта относительно домашней
  директори пользователя;
Переменые:
- name - имя секции к ней автоматически добавляется суффикс -org;
- path - относительный путь, который вместе с глобальной переменной;
Ключевые переменные:
- with-toc - определяет добавление секции содержимого
- section-numbers - определяет нумерацию секций;
- headline-levels - определяет уровень секций попадающих в оглавление;
- html-preamble - определяел добавление преамбулы в html-файл;
- html-head - определяет заголовок html-файла;
- exclude - определяет какие файлы не должны обрабатываться
  експортером в html;
- recursive - поределяет рекурсивность обработки файлов во вложенных
  каталогах.
"
  `(,(concat name "-" "org" )
    :base-directory       ,(directory-sleshed (concat "~/" prj-root "/" path "/"))
    :publishing-directory ,(directory-sleshed (concat prefix pub-root "/" path "/"))
    :base-extension       "org"
    :publishing-function  org-html-publish-to-html
    :exclude              ,exclude 
    :headline-levels      ,headline-levels
    :section-numbers      ,section-numbers
    :with-toc             ,with-toc
    :html-head            ,html-head
    :html-preamble        ,html-preamble
    :recursive            ,recursive))

(cl-defun org-att-list (name ext path &key (recursive nil) (p-dir path))
  "Глобальные переменные:
- prj-root - должна указывать на каталог проекта относительно домашней
  директори пользователя;
Переменые:
- name - имя секции к ней автоматически добавляется суффикс -org;
- ext - определяет расширения фыйлов подлежащие выводу;  
- path - относительный путь, который вместе с глобальной переменной;
Ключевые переменные:
- recursive - поределяет рекурсивность обработки файлов во вложенных
  каталогах.
"
  `(,(concat name "-" ext)
    :base-directory       ,(directory-sleshed (concat "~/" prj-root "/" path "/"))
    :publishing-directory ,(directory-sleshed (concat prefix pub-root "/" p-dir "/"))
    :base-extension       ,ext
    :publishing-function  org-publish-attachment
    :recursive            ,recursive))

(cl-defun org-web-list (&key (site "website"))
 "Добавляет к переменной org-publish-project-alist (определяющей
параметры вывода org-файлов в html) секцию 'website'.

Секция 'website' при этом включает в себя все имена секций,
находящиеся в переменной org-publish-project-alist перед её
'website' добавленим.
"
  (setq org-publish-project-alist
        (append org-publish-project-alist
                `((,site :components
                   ,(cl-loop for i in org-publish-project-alist
                             collect (first i)))))))

(cl-defun org-components-list (components &key (group "group") (add-components t))
  "Добавляет к переменной org-publish-project-alist (определяющей
параметры вывода org-файлов в html) секцию 'website'.

Секция 'group' при этом включает в себя все имена секций,
находящиеся в переменной org-publish-project-alist перед её
'group' добавленим.
"
  (when add-components
    (setq org-publish-project-alist (append org-publish-project-alist components)))
  (setq org-publish-project-alist
        (append org-publish-project-alist
                `((,group :components
                          ,(cl-loop for i in components
                                    collect (first i)))))))

(cl-defun org-setup (directory project-root &key (revative-to-home nil))
  "Устанавливает глобальные переменные:
- directory - корневой каталог для публикации файлов;
- prj-root - задающую место расположения файлов для публикаци.
- pub-dir-deep - количество раз, которое нужно пройти вверх по дереву
  каталоов из файла вызывающего функцию чтоб добраться до корневог
  каталога проекта.
"
  (setq eval-expression-print-length 100)
  (setq prj-root project-root)
  (setq pub-root
        (if revative-to-home
            prj-root
          (file-name-nondirectory (directory-file-name project-root))))
  (setq prefix (concat (directory-file-name directory) "/"))
  (list :prefix prefix
        :prj-root prj-root
        :pub-root pub-root))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cl-defun org-setup-bak (directory project-root
                               &key
                               (pub-dir-deep 0)
                               (local-prefix "~/public_html/")
                               (remote-prefix "//n133906/home/_namatv/public_html/Site/"))
  "Устанавливает глобальные переменные:
- prefix - задает путь к публикации;
- prj-root - задающую место расположения файлов для публикаци."
  (setq eval-expression-print-length 100)
  (setq prj-root project-root)
  (setq pub-root (remove-n-parents-from-path prj-root pub-dir-deep))
  (cond
   ((equal (system-name) "uakazi-note")
    (setq prefix (concat local-prefix directory "/")))
   (t (setq prefix (concat remote-prefix directory "/"))))
  (list :prefix prefix
        :prj-root prj-root
        :pub-root pub-root))
