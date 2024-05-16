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
    (dotimes (_ (1- level))
      (setq current-path (directory-file-name (file-name-directory current-path))))
    current-path))

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
  `(,(concat name "-" "org" )
    :base-directory       ,(concat "~/" prj-root "/" path "/")
    :publishing-directory ,(concat prefix prj-root "/" path "/")
    :base-extension       "org"
    :publishing-function  org-html-publish-to-html
    :exclude              ,exclude 
    :headline-levels      ,headline-levels
    :section-numbers      ,section-numbers
    :with-toc             ,with-toc
    :html-head            ,html-head
    :html-preamble        ,html-preamble
    :recursive            ,recursive))

(cl-defun org-att-list (name ext path &key (recursive nil))
  `(,(concat name "-" ext)
    :base-directory ,(concat "~/" prj-root "/" path "/")
    :publishing-directory ,(concat prefix prj-root "/" path "/")
    :base-extension       ,ext
    :publishing-function  org-publish-attachment
    :recursive            ,recursive))

(cl-defun org-web-list ()
  (setq org-publish-project-alist
        (append org-publish-project-alist
                `(("website" :components
                   ,(cl-loop for i in org-publish-project-alist
                             collect (first i)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cl-defun org-pub-str (name path recursive
                            &key
                            (with-toc "nil")
                            (section-numbers "nil")
                            (headline-levels "3")
                            (html-preamble "t")
                            (exclude "ToDo.org"))
  (concat "\n(\"" name "-" "org" "\""
          "\n  :base-directory       ,(concat \"~/\" prj-root \"/" path "/\")"
          "\n  :publishing-directory ,(concat prefix prj-root \"/" path "/\")"
          "\n  :base-extension       \"" "org" "\""
          "\n  :publishing-function  org-html-publish-to-html"
          "\n  :exclude              \"" exclude "\" ;; regexp"
          "\n  :headline-levels      " headline-levels
          "\n  :section-numbers      " section-numbers
          "\n  :with-toc             " with-toc
          "\n  :html-head            ,html-head"
          "\n  :html-preamble        " html-preamble
          "\n  :recursive            " recursive "\n)"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun org-pub (name path recursive)
  "Печатает в буфер секцию для публикации org-файлов"
  (interactive
   (list (read-string "Name     : " )
         (read-string "Path     : " "org/...")
         (read-string "Recursive: " "nil")))
  (insert (org-pub-str name path recursive)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cl-defun org-att-str (name ext path)
  (concat "\n(\"" name "-" ext "\""
          "\n  :base-directory       ,(concat \"~/\" prj-root \"/" path "/\")"
          "\n  :publishing-directory ,(concat prefix prj-root \"/" path "/\")"
          "\n  :base-extension       \"" ext "\""
          "\n  :publishing-function org-publish-attachment\n)"))
                       
(defun org-att (name ext path)
  "Печатает в буфер секцию для публикации файлов с произвольным "
  (interactive
   (list (read-string "Name     : "      )
         (read-string "Extension: " "png")
         (read-string "Path     : "  name)))
  (insert (org-att-str name ext path)))

