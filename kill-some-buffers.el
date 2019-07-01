;;;; kill-some-buffers.el

(defun kill-buffer-if-exist (b-name)
  (let ((buff (get-buffer b-name)))
    (when buff (kill-buffer buff))))

(defun k-b ()
  (interactive)
  (kill-buffer-if-exist "*scratch*")
  (kill-buffer-if-exist "*GNU Emacs*")
  (kill-buffer-if-exist "*Completions*")
  (kill-buffer-if-exist "*Messages*")
  (kill-buffer-if-exist "*slime-events*")
  (kill-buffer-if-exist "*slime-xref*")
  (kill-buffer-if-exist "*Buffer List*")
  (kill-buffer-if-exist "*Help*")
  (kill-buffer-if-exist "*slime-compilation*")
  (kill-buffer-if-exist "*shell*")
  (kill-buffer-if-exist "*slime-description*")
  (kill-buffer-if-exist "*slime-source*")
  )

(defun s-r ()
  (interactive)
  (slime-restart-inferior-lisp)
  (k-b))

(k-b)
