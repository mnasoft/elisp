;;;; Установка текущей программы для проверки орфографии.
(if (executable-find "hunspell")
    (progn
      (setq ispell-program-name "hunspell")
      (setq ispell-really-aspell   nil)
      (setq ispell-really-hunspell t)
      (setq ispell-really-enchant  nil)
      (setq ispell-dictionary "ru-en")))

;;;; Проверка орфографии текущего буфера.
(global-set-key (kbd "C-c C-l") 'ispell)

;;;; Включение\выключение режима проверки орфографии на лету.
(global-set-key (kbd "C-c C-f") 'flyspell-mode)
