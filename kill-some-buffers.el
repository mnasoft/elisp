;;;; kill-some-buffers.el

(defun my/save-and-kill-all-file-buffers ()
  (interactive)
  (save-some-buffers t)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when buffer-file-name
        (kill-buffer buf)))))

(defun my/kill-non-file-buffers-except-sly ()
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (let ((name (buffer-name buf)))
        (when (and (not buffer-file-name)
                   (not (string-match-p "^ ?\\*sly" name)))
          (kill-buffer buf))))))

(global-set-key (kbd "C-c k f") #'my/save-and-kill-all-file-buffers)
(global-set-key (kbd "C-c k n") #'my/kill-non-file-buffers-except-sly)

