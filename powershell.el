;;;; ./powershell-support.el -*- lexical-binding: t -*-
;;;; Offline PowerShell integration

;; PowerShell major mode
(autoload 'powershell-mode "powershell" nil t)
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode))

;; Org-babel PowerShell execution
(when (locate-library "ob-powershell")
  (require 'ob-powershell))

(setq org-babel-powershell-os-command
      (cond
       ((eq system-type 'windows-nt) "powershell")
       ((executable-find "pwsh")     "pwsh")
       (t                            "powershell")))

(eval-after-load 'org
  '(org-babel-do-load-languages
    'org-babel-load-languages
    '((powershell . t))))

(provide 'powershell-support)
;;; powershell-support.el ends here
