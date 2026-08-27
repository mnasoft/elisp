;;; ...  -*- lexical-binding: t -*-
;;;; ~/elisp/find-and-replace.el

(defun my/replace-in-files-silently (pattern replacement directory &optional extensions)
  "Recursively replace PATTERN with REPLACEMENT in DIRECTORY.
EXTENSIONS — список расширений, например '(\"lisp\" \"asd\")."
  (interactive
   (list
    (read-string "Search pattern: ")
    (read-string "Replace with: ")
    (read-directory-name "Directory: ")
    (split-string (read-string "Extensions (space-separated, empty = all): ") " " t)))
  (let* ((dir (expand-file-name directory))
         (files (directory-files-recursively
                 dir
                 (if extensions
                     (concat "\\." (regexp-opt extensions) "$")
                   ".*"))))
    (dolist (file files)
      (with-temp-buffer
        (insert-file-contents file)
        (goto-char (point-min))
        (when (re-search-forward pattern nil t)
          (goto-char (point-min))
          (while (re-search-forward pattern nil t)
            (replace-match replacement))
          (write-region (point-min) (point-max) file nil 'silent))))))
