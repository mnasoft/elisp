;;; proxy.el --- Configure URL proxy from environment -*- lexical-binding: t; -*-

;; Author: Mykola
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1"))
;; Keywords: comm
;; URL:

;;; Commentary:

;; Configure `url-proxy-services' from the environment variables
;; HTTP_PROXY and HTTPS_PROXY.
;;
;; If both variables are defined, their values are used to configure
;; HTTP and HTTPS proxy services.
;;
;; If either variable is missing, `url-proxy-services' is set to nil.
;;
;; Usage:
;;
;;   (require 'proxy)
;;
;; The proxy configuration is applied automatically when this library
;; is loaded.
;;
;; To re-read the environment variables manually:
;;
;;   (proxy-set-url-proxy-services)

;;; Code:

(require 'url)


(defun proxy-set-url-proxy-services ()
  "Configure `url-proxy-services' from environment variables.

Read HTTP_PROXY and HTTPS_PROXY from the environment.

If both variables are defined, configure HTTP and HTTPS proxy
services accordingly.  Otherwise set `url-proxy-services' to nil."
  (let ((http-proxy  (getenv "HTTP_PROXY"))
        (https-proxy (getenv "HTTPS_PROXY")))
    (setq url-proxy-services
          (when (and http-proxy https-proxy)
            `(("http"  . ,http-proxy)
              ("https" . ,https-proxy))))))


;;; Apply configuration

(proxy-set-url-proxy-services)


(provide 'proxy)

;;; proxy.el ends here
