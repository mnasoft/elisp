;;; ./hunspell.el -*- lexical-binding: nil -*-

(setq ispell-program-name "hunspell"
      ispell-dictionary "en_US" ;"uk_UA,ru_RU,en_US"
      )

(defun init-dictionary-uk-ru-en ()
  "Инициализирует список словарей для набора украинский/русский/английский.

Регистрирует словари Hunspell для украинского, русского и английского
языков, чтобы можно было быстро переключаться между режимами проверки
правописания.

Каждая запись в `ispell-dictionary-alist' имеет вид:
  (\"LANG\" \"START-REGEXP\" \"END-REGEXP\" \"SPECIAL-REGEXP\" t (\"-d\" \"LANG\") nil utf-8)
Где:
  - LANG           - код словаря Hunspell, например \"ru_RU\" или \"en_US\".
  - START-REGEXP   - шаблон для начала слова.
  - END-REGEXP     - шаблон для конца слова.
  - SPECIAL-REGEXP - символы, которые могут входить в слово, например
                     апострофы или дефисы.

  - t              - флаг, указывающий, что словарь поддерживается этим режимом.
  - (\"-d\" \"LANG\")  - аргументы командной строки для Hunspell.
  - nil          - дополнительный параметр, обычно не используется.
  - utf-8        - кодировка текста.

Эта структура нужна для того, чтобы Emacs корректно разбивал слова и
запускал нужный словарь при проверке орфографии."
  (when (and (boundp 'ispell-dictionary-alist)
             (null (assoc "uk_UA,ru_RU,en_US" ispell-dictionary-alist)))
    (add-to-list 'ispell-dictionary-alist
                 '("ru_RU"
                   "[[:alpha:]]"
                   "[^[:alpha:]]"
                   "['-]" ;; [0-9'-]
                   t
                   ("-d" "ru_RU")
                   nil
                   utf-8))
    (add-to-list 'ispell-dictionary-alist
                 '("en_US"
                   "[[:alpha:]]"
                   "[^[:alpha:]]"
                   "[0-9'-]"
                   t ("-d" "en_US")
                   nil
                   utf-8))
    (add-to-list 'ispell-dictionary-alist
                 '("uk_UA,ru_RU,en_US"
                   "[[:alpha:]]"
                   "[^[:alpha:]]"
                   "[0-9'`ʼ’-]" ;; "['`ʼ’]"
                   t
                   ("-d" "uk_UA,ru_RU,en_US")
                   nil
                   utf-8))
    (add-to-list 'ispell-dictionary-alist
                 '("uk_UA"
                   "[[:alpha:]]"
                   "[^[:alpha:]]"
                   "[0-9'`ʼ’-]" ;; "['`ʼ’]"
                   t
                   ("-d" "uk_UA")
                   nil
                   utf-8))))

(defun switch-dictionary-uk-ru-en ()
  "Меняет активный словарь в фиксированном цикле:
uk_UA -> ru_RU -> en_US -> смешанный -> uk_UA.
Переключает текущий словарь проверки правописания между доступными
языками.
Перед сменой словаря гарантируется наличие кастомного списка словарей и
вызывается соответствующая команда ispell для обновления режима."
  (interactive)
  (if (boundp 'ispell-dictionary-alist)
    (progn
      (init-dictionary-uk-ru-en)
      (let* ((dict ispell-current-dictionary)
             (new (cond
                   ((string= dict "uk_UA"            ) "ru_RU")
                   ((string= dict "ru_RU"            ) "en_US")
                   ((string= dict "en_US"            ) "uk_UA,ru_RU,en_US" )
                   ((string= dict "uk_UA,ru_RU,en_US") "uk_UA"))))
        (ispell-change-dictionary new)
        (message "Dictiorary set to: %s" new)))
    (progn
      (message "Ispell not initialysed yet now."))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Префикс для всех команд проверки орфографии
(define-prefix-command 'my-spell-map)
(global-set-key (kbd "C-;") 'my-spell-map)
;; Запасной префикс: в некоторых терминалах/раскладках C-; не распознается.
;; (global-set-key (kbd "C-c ;") 'my-spell-map)
;;
;; Проверка всего буфера
(define-key my-spell-map (kbd "a") #'ispell)
(define-key my-spell-map (kbd "ф") #'ispell)
;; Проверка слова под курсором
(define-key my-spell-map (kbd "w") #'ispell-word)
(define-key my-spell-map (kbd "ц") #'ispell-word)
;; Проверка региона
(define-key my-spell-map (kbd "r") #'ispell-region)
(define-key my-spell-map (kbd "к") #'ispell-region)
;; Исправить предыдущее слово
(define-key my-spell-map (kbd "p") #'flyspell-correct-word-before-point)
(define-key my-spell-map (kbd "з") #'flyspell-correct-word-before-point)
;; Включить или отключить flyspell-mode
(define-key my-spell-map (kbd "f") #'flyspell-mode)
(define-key my-spell-map (kbd "а") #'flyspell-mode)
;; Альтернативная команда исправления (если нужно)
(define-key my-spell-map (kbd "b") #'flyspell-buffer)
(define-key my-spell-map (kbd "и") #'flyspell-buffer)
;; Привязываем команду переключения словаря к удобной комбинации клавиш.
(define-key my-spell-map (kbd "d") #'switch-dictionary-uk-ru-en)
(define-key my-spell-map (kbd "в") #'switch-dictionary-uk-ru-en)
;;
;; Привязываем команду переключения словаря к удобной комбинации клавиш.
(global-set-key (kbd "C-c d") #'switch-dictionary-uk-ru-en)

;; ispell-dictionary-alist
