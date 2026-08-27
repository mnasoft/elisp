;;; ...  -*- lexical-binding: t -*-
;;;; ~/elisp/powershell.el

;;; powershell-support.el --- Офлайн-інтеграція PowerShell для Emacs
;;
;; Цей файл надає мінімальну, автономну конфігурацію, яка забезпечує:
;;
;;   1) Режим PowerShell (`powershell-mode`) для редагування файлів .ps1:
;;      - підсвітку синтаксису
;;      - правила індентації
;;      - автоматичну активацію через `auto-mode-alist`
;;
;;   2) Виконання PowerShell-блоків у Org-mode через Org Babel:
;;      - додає `(powershell . t)` до `org-babel-load-languages`
;;      - завантажує `ob-powershell` для інтеграції з Babel
;;
;; Конфігурація повністю працює в ОФЛАЙН-режимі:
;;   - без MELPA, без завантаження пакетів
;;   - без зовнішніх залежностей, окрім `powershell.el` та `ob-powershell.el`
;;   - підходить для ізольованих або обмежених середовищ
;;
;; Автоматичне визначення платформи:
;;   - На Windows (`system-type 'windows-nt`) використовується "powershell"
;;   - На GNU/Linux або macOS використовується "pwsh", якщо він доступний
;;   - Якщо `pwsh` не знайдено, використовується "powershell" як fallback
;;
;; Це робить файл портативним для:
;;   - Windows PowerShell (5.x)
;;   - PowerShell Core (7.x) на Linux/macOS
;;
;; Щоб активувати цей модуль, розмістіть його у вашому `load-path` і додайте:
;;
;;     (load "~/.emacs.d/powershell-support.el")
;;
;; Жоден доступ до мережі не потрібен.
;;
;;; Коментар:
;;
;; Цей модуль призначений для користувачів, яким потрібна надійна підтримка
;; PowerShell в Emacs на комп’ютерах без доступу до Інтернету. Він об’єднує
;; ключові компоненти для редагування та виконання PowerShell‑коду без
;; використання менеджерів пакетів або онлайн‑репозиторіїв.
;;
;;; Код:

(require 'cl-lib)

;; 1) PowerShell major mode
(require 'powershell)
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode))

;; 2) Org-babel PowerShell execution
(require 'ob-powershell)

;; Автоматичне визначення платформи та вибір команди PowerShell
(cond
 ((eq system-type 'windows-nt)
  ;; Windows: стандартний Windows PowerShell
  (setq org-babel-powershell-os-command "powershell"))
 ((executable-find "pwsh")
  ;; Linux/macOS: якщо є PowerShell Core
  (setq org-babel-powershell-os-command "pwsh"))
 (t
  ;; fallback: якщо pwsh немає, але не Windows
  (setq org-babel-powershell-os-command "powershell")))

;; Додаємо PowerShell до списку мов Org-babel
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((powershell . t))))

(provide 'powershell-support)
;;; powershell-support.el ends here

