;;; yes-or-no-p-tests.el --- ERT tests for yes-or-no-p -*- lexical-binding: t; -*-

(require 'ert)
(require 'yes-or-no-p)

(ert-deftest yes-or-no-p-is-an-alias-for-y-or-n-p ()
  (should (eq (indirect-function 'yes-or-no-p)
              (indirect-function 'y-or-n-p))))

(ert-deftest yes-or-no-p-and-y-or-n-p-have-same-function ()
  (should (eq (symbol-function 'yes-or-no-p)
              (symbol-function 'y-or-n-p))))

(provide 'yes-or-no-p-tests)
;;; yes-or-no-p-tests.el ends here
