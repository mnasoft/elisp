;;; ./hunspell.el -*- lexical-binding: nil -*-

;;;; Установка текущей программы для проверки орфографии.
;; ============================
;; Emacs + Hunspell (ru_RU, uk_UA, en_US)
;; ============================

(defun my-select-dictionary ()
  (cond
   ((derived-mode-p 'prog-mode)
    (ispell-change-dictionary "en_US"))
   ((derived-mode-p 'text-mode)
    (ispell-change-dictionary "uk_UA"))
   ((derived-mode-p 'org-mode)
    (ispell-change-dictionary "uk_UA,ru_RU,en_US"))
   (t
    (ispell-change-dictionary "uk_UA,ru_RU,en_US"))))

(defun my-dic-add (dic)
  (if (boundp 'ispell-dictionary-alist)
      (add-to-list 'ispell-dictionary-alist dic) (setq ispell-dictionary-alist (list dic))))

(defun hunspell-load ()
  (interactive)
  (if (executable-find "hunspell")
      (let ((uk-ru-en-dict-alist '("uk_UA,ru_RU,en_US" "[[:alpha:]]" "[^[:alpha:]]" "" t ("-d" "uk_UA,ru_RU,en_US") nil utf-8))
            (uk-dict-alist       '("uk_UA"             "[[:alpha:]]" "[^[:alpha:]]" "" t ("-d" "uk_UA")             nil utf-8))
            (ru-dict-alist       '("ru_RU"             "[[:alpha:]]" "[^[:alpha:]]" "" t ("-d" "ru_RU")             nil utf-8))
            (en-dict-alist       '("en_US"             "[[:alpha:]]" "[^[:alpha:]]" "" t ("-d" "en_US")             nil utf-8)))
    
        (setq ispell-program-name "hunspell")
        (setq ispell-dictionary-alist nil)
        (my-dic-add uk-ru-en-dict-alist)
        (my-dic-add uk-dict-alist)
        (my-dic-add ru-dict-alist)
        (my-dic-add en-dict-alist)
        ;;(ispell-change-dictionary "uk_UA,ru_RU,en_US")
        ;;(setq ispell-dictionary "uk_UA,ru_RU,en_US")
        )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  ;; Префікс для всіх команд орфографії
  (define-prefix-command 'my-spell-map)
  (global-set-key (kbd "C-;") 'my-spell-map)

  ;; Перевірка всього буфера
  (define-key my-spell-map (kbd "C-a") #'ispell)

  ;; Перевірка слова під курсором
  (define-key my-spell-map (kbd "C-w") #'ispell-word)

  ;; Виправити попереднє слово
  (define-key my-spell-map (kbd "C-p") #'flyspell-correct-word-before-point)

  ;; Увімкнути/вимкнути flyspell-mode
  (define-key my-spell-map (kbd "C-f") #'flyspell-mode)

  ;; Альтернативна команда виправлення (якщо треба)
  (define-key my-spell-map (kbd "C-b") #'flyspell-buffer))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(eval-after-load "ispell" (hunspell-load))
(if (executable-find "hunspell")
    (progn
      (setq ispell-program-name "hunspell")
      (require 'ispell)
      ;; (hunspell-load)
      ))


;;; ispell-dictionary-alist
;;; (ispell-change-dictionary "uk_UA,ru_RU,en_US") 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(add-hook 'after-change-major-mode-hook #'my-select-dictionary)

;; (add-hook 'text-mode-hook #'flyspell-mode)
;; (add-hook 'org-mode-hook  #'flyspell-mode)
;; (add-hook 'prog-mode-hook #'flyspell-prog-mode)

(print (b-r-name))

