
(require 'ox-publish)

(setq org-publish-project-alist
      '(
	;; ... add all the components here (see below)...
	("org-notes"
	 :base-directory "~/org/"
	 :base-extension "org"
	 :publishing-directory "~/public_html/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4	  ; Just the default for this project.
	 :auto-preamble t
	 )
	("org-static"
	 :base-directory "~/org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/public_html/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("org" :components ("org-notes" "org-static"))))

(defun mnas-org-publish-org ()
  (interactive)
  (org-publish-project "org"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; (defun mnas-org-publish-buffer () (interactive) (save-buffer) (save-excursion (org-publish-current-file)) (let* ((proj (org-publish-get-project-from-filename buffer-file-name)) (proj-plist (cdr proj)) (rel (file-relative-name buffer-file-name (plist-get proj-plist :base-directory))) (dest (plist-get proj-plist :publishing-directory))) (browse-url (concat "file://" (file-name-as-directory (expand-file-name dest)) (file-name-sans-extension rel) ".html"))))

;;;; (add-hook 'org-mode-hook (lambda() (local-set-key [f12] 'mnas-org-publish-buffer)))
;;;; (setq org-publish-project-alist '(("org-notes" :base-directory "~/org/" :publishing-directory "~/public_html/" :publishing-function org-twbs-publish-to-html :with-sub-superscript t)))
