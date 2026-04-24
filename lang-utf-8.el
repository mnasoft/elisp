;;;; ~/elisp/lang-utf-8.el

(getenv "LANG")
(getenv "LC_ALL")
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
