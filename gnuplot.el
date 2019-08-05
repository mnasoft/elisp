;;;; ~/elisp/gnuplot.el

;;;; Configuration:
;;;; 
;;;; If you installed this via `package.el', you should take advantage
;;;; of autoloading.  You can customize features using `defvar' and
;;;; `eval-after-load', as illustrated below:
;;;;
;;;; specify the gnuplot executable (if other than "gnuplot")

;;(defvar gnuplot-program "/usr/bin/gnuplot")

;;;; set gnuplot arguments (if other than "-persist")

;;(defvar gnuplot-flags "-persist -pointsize 2")

;;;; if you want, add a mode hook.  e.g., the following turns on
;;;; spell-checking for strings and comments and automatically cleans
;;;; up whitespace on save.

;;(eval-after-load 'gnuplot-mode '(add-hook 'gnuplot-mode-hook (lambda () (flyspell-prog-mode) (add-hook 'before-save-hook 'whitespace-cleanup nil t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; A recent version of this file can be found at http://github.com/bruceravel/gnuplot-mode/
;;;; To autoload gnuplot-mode on any file with gp extension, put this in your .emacs file
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot-mode" t)

;;;; Something like
;;(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))
;;;; is useful for having files ending in .gp start up in gnuplot-mode.

;;;; Something like
;;(global-set-key [(f9)] 'gnuplot-make-buffer)
;;;; may be useful.  This binds f9 to the function that opens a scratch
;;;; buffer (i.e. one that is not visiting a file) in gnuplot-mode.
;;;; This is handy for your quick 'n' dirty plotting chores.

;;;; To use the `gnuplot-info-lookup-symbol' function, the file
;;;; gnuplot.info MUST be installed somewhere that info can find it.
;;;; This means you must either:
;;;;   1.  Copy gnuplot.info to the normal info directory or
;;;;   2.  Make sure info can find gnuplot.info by putting this in your
;;;;       .emacs file:
;;(setenv "INFOPATH" (concat (getenv "INFOPATH") ":" (expand-file-name "/path/to/file")))
;;;;       where "/path/to/file" is the location of gnuplot.info

;;;; This mode has been tested extensively with GNU Emacs 23 and 24, and
;;;; in a limited manner with GNU Emacs 22 and XEmacs 21.
