;;;; ./inferior-lisp/default.el

(setq use-sly-connection t)
(setq sly-host "127.0.0.1")
(setq sly-port 4005)

(setq sly-lisp-implementations
      '((sbcl ("sbcl"
               "--dynamic-space-size" "16384"))))

(setq inferior-lisp-program "sbcl")

;; Вызов функции подключения
(sly-connect-or-start sly-host sly-port use-sly-connection)
