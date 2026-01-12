;;;; inferior-lisp-program.el

(defun sly--host-port-open-p (host port)
  "Return non-nil if HOST:PORT is accepting TCP connections."
  (condition-case nil
      (let ((proc (open-network-stream
                   "sly-port-test" nil host port
                   :type 'plain)))
        (when proc
          (delete-process proc)
          t))
    (error nil)))

(defun sly-connect-or-start (host port use-existing)
  "Подключиться к SLY-серверу на HOST:PORT, если он доступен.
Если USE-EXISTING не-nil, но сервер недоступен — запустить новый sly.
Если USE-EXISTING nil — всегда запускать новый sly."
  (cond
   ;; 1) Пользователь хочет подключиться к существующему серверу
   ;;    и порт открыт → подключаемся
   ((and use-existing
         (sly--host-port-open-p host port))
    (message "SLY: detected running server at %s:%d, connecting..." host port)
    (sly-connect host port))

   ;; 2) Пользователь хочет подключиться к существующему серверу,
   ;;    но порт закрыт → запускаем новый sly
   (use-existing
    (message "SLY: %s:%d is closed, starting a new server..." host port)
    (sly))

   ;; 3) Пользователь НЕ хочет использовать существующий сервер
   (t
    (message "SLY: use-existing=nil, starting a new server...")
    (sly))))

;;;; Если существует файл с индивидуальными параметрами запуска SBCL
;;;; загружаем его. Иначе загружаем файл с начтройками по умолчанию.
(if (file-exists-p (concat  "~/elisp/inferior-lisp" "/" system-name ".el"))
    (load (concat  "~/elisp/inferior-lisp" "/" system-name ".el")) ;; Загружаем файл с индивидуальными параметрами запуска SBCL
  (load (concat  "~/elisp/inferior-lisp/default.el")) ;; Загружаем файл с параметрами запуска SBCL по умолчанию
  ) 
      

