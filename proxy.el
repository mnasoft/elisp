;;; ./proxy.el  -*- lexical-binding: t -*-

(defun set-url-proxy-service ()
  (let ((http-proxy  (getenv  "HTTP_PROXY"))
        (https-proxy (getenv  "HTTPS_PROXY")))
    (if
     (and http-proxy https-proxy)
      (setq url-proxy-services
            `(("http"  . ,http-proxy)
              ("https" . ,https-proxy)))
      (setq url-proxy-services nil))))

(set-url-proxy-service)
