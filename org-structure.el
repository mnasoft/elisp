;;;; org-structure.el


(defun org-remove-blank-line ()
  (newline) ;;;; (org-return)
  (dotimes (i 2) (delete-blank-lines))
  (dotimes (i 2) (previous-line)))

(defun org-remove-blank-lines ()
  "Заготовка кода для elisp"
  (interactive)
  (end-of-buffer)
  (while (> (point) 1)
    (org-remove-blank-line)))


(defun  org-populete-items-2 ()
  "Заготовка кода для elisp"
  (interactive)
  (move-end-of-line nil)
  (delete-horizontal-space)
  (set-mark-command nil)
  (move-beginning-of-line nil)
  (kill-region 0 0 0)
  (delete-char 1)
  (progn
    (other-window 1)
    (isearch-search-string (car kill-ring) nil nil)
    (setq kill-ring nil)
    )
  (move-beginning-of-line nil)
  (insert "***" )
  (insert " " ) 
  (move-end-of-line nil)
  (other-window -1))

(defun  org-populete-items-3 ()
  "Заготовка кода для elisp"
  (interactive)
  (move-end-of-line nil)
  (delete-horizontal-space)
  (set-mark-command nil)
  (move-beginning-of-line nil)
  (kill-region 0 0 0)
  (delete-char 1)
  (progn
    (other-window 1)
    (isearch-search-string (car kill-ring) nil nil)
    (setq kill-ring nil)
    )
  (move-beginning-of-line nil)
  (insert "***" )
  (insert " " ) 
  (move-end-of-line nil)
  (other-window -1))

(defun  org-populete-items-4 ()
  "Заготовка кода для elisp"
  (interactive)
  (move-end-of-line nil)
  (delete-horizontal-space)
  (set-mark-command nil)
  (move-beginning-of-line nil)
  (kill-region 0 0 0)
  (delete-char 1)
  (progn
    (other-window 1)
    (isearch-search-string (car kill-ring) nil nil)
    (setq kill-ring nil)
    )
  (move-beginning-of-line nil)
  (insert "****" )
  (insert " " ) 
  (move-end-of-line nil)
  (other-window -1))

(defun  org-populete-items-5 ()
  "Заготовка кода для elisp"
  (interactive)
  (move-end-of-line nil)
  (delete-horizontal-space)
  (set-mark-command nil)
  (move-beginning-of-line nil)
  (kill-region 0 0 0)
  (delete-char 1)
  (progn
    (other-window 1)
    (isearch-search-string (car kill-ring) nil nil)
    (setq kill-ring nil)
    )
  (move-beginning-of-line nil)
  (insert "*****" )
  (insert " " ) 
  (move-end-of-line nil)
  (other-window -1))
