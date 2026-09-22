;;; ./hunspell.el -*- lexical-binding: nil -*-

(add-to-list 'ispell-dictionary-alist
             '("en_US"
               "[[:alpha:]]"
               "[^[:alpha:]]"
               "[0-9']"
               t ("-d" "en_US")
               nil
               utf-8))
;;;
(add-to-list 'ispell-dictionary-alist
             '("ru_RU"
               "[[:alpha:]]"
               "[^[:alpha:]]"
               "[0-9']"
               t
               ("-d" "ru_RU")
               nil
               utf-8))
;;;
(add-to-list 'ispell-dictionary-alist
             '("uk_UA"
               "[[:alpha:]]"
               "[^[:alpha:]]"
               "[']"
               t
               ("-d" "uk_UA")
               nil
               utf-8))
;;;
(caar
(add-to-list 'ispell-dictionary-alist
             '("uk_UA,ru_RU,en_US"
               "[[:alpha:]]"
               "[^[:alpha:]]"
               "[0-9']"
               t
               ("-d" "uk_UA,ru_RU,en_US")
               nil
               utf-8)))

(setq ispell-program-name "hunspell"
      ispell-dictionary "en_US" ;"uk_UA,ru_RU,en_US"
      )

;;ispell-dictionary-alist

(defun switch-dictionary-uk-ru-en ()
  ""
  (interactive)
  (let* ((dict ispell-current-dictionary)
         (new
          (cond
           ((string= dict "uk_UA")
            "ru_RU")
           ((string= dict "ru_RU")
            "en_US")
           ((string= dict "en_US")
            "uk_UA,ru_RU,en_US")
           ((string= dict "uk_UA,ru_RU,en_US")
            "uk_UA")
           ((null dict))
           )))
    (ispell-change-dictionary new)
    (message "Switced dictionary from %s to %s" dict new)))

(global-set-key (kbd "C-c d") #'switch-dictionary-uk-ru-en)
