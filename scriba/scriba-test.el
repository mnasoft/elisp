;;; scriba-test.el --- Tests for scriba -*- lexical-binding: t; -*-

(require 'ert)
(require 'scriba)

(defun scriba-test--output (function &rest args)
  "Return text inserted by FUNCTION called with ARGS."
  (with-temp-buffer
    (apply function args)
    (buffer-string)))

(ert-deftest scriba-code-lisp-test ()
  (should (equal (scriba-test--output #'scriba-code-lisp)
                 "@begin[lang=lisp](code)\n\n@end(code)\n")))

(ert-deftest scriba-code-text-test ()
  (should (equal (scriba-test--output #'scriba-code-text)
                 "@begin[lang=txt](code)\n\n@end(code)\n")))

(ert-deftest scriba-doc-function-test ()
  (should (equal (scriba-test--output #'scriba-doc-function)
                 "@cl:doc(function ...)\n")))

(ert-deftest scriba-link-external-test ()
  (should (equal (scriba-test--output #'scriba-link-external
                                      "https://www.gnu.org/" "GNU")
                 "@link[uri=\"https://www.gnu.org/\"](GNU)")))

(ert-deftest scriba-internal-link-test ()
  (should (equal (scriba-test--output #'scriba-link-internal)
                 "@ref[id=data-table-3](table)")))

(provide 'scriba-test)

;;; scriba-test.el ends here
