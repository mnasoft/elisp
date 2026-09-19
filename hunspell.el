;;; ./hunspell.el -*- lexical-binding: t -*-

;;;; Установка текущей программы для проверки орфографии.
(defun hunspell-load ()
  (interactive)
  (if (executable-find "hunspell")
      (progn
	(setq ispell-program-name "hunspell")
	(setq ispell-really-aspell   nil)
	(setq ispell-really-hunspell t)
	(setq ispell-really-enchant  nil)
	(setq ispell-dictionary "ru-en")
	(if (boundp 'ispell-dictionary-alist)
	    (add-to-list 'ispell-dictionary-alist '("ru-en" "[[:alpha:]]" "[^[:alpha:]]" "" t ("-d" "ru-en") nil utf-8)))
	(setq ispell-dictionary-alist '(("ru-en" "[[:alpha:]]" "[^[:alpha:]]" "" t ("-d" "ru-en") nil utf-8))))))

;;;; (cadr ispell-dictionary-alist)
;;;; ispell-local-dictionary
