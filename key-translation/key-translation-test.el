;;; key-translation-test.el --- Tests for key-translation -*- lexical-binding: t; -*-

(require 'ert)
(require 'cl-lib)
(require 'key-translation)

(ert-deftest key-translation-cl-loop-across-test ()
  (should
   (equal
    (cl-loop for to-char across "abc"
             for from-char across "абв"
             collect (list (char-to-string from-char)
                           (char-to-string to-char)))
    '(("а" "a") ("б" "b") ("в" "c")))))

(ert-deftest key-translation-cl-loop-shortest-string-test ()
  (should
   (equal
    (cl-loop for a across "abc"
             for b across "12"
             collect (list a b))
    '((?a ?1) (?b ?2)))))

(ert-deftest key-translation-cl-loop-prefixes-test ()
  (let ((prefixes '("C-" "M-" "C-M-" "C-x " "C-c C-d " "C-h ")))
    (should
     (equal (cl-loop for prefix in prefixes collect prefix)
            prefixes))))

(ert-deftest key-translation-single-key-test ()
  (let ((key-translation-map (make-sparse-keymap)))
    (key-translation-define "C-" "a" "ф")
    (should
     (equal (lookup-key key-translation-map (kbd "C-ф"))
            (kbd "C-a")))))

(ert-deftest key-translation-define-map-test ()
  (let ((key-translation-map (make-sparse-keymap)))
    (key-translation-define-map "C-" "abc" "фис")
    (should (equal (lookup-key key-translation-map (kbd "C-ф")) (kbd "C-a")))
    (should (equal (lookup-key key-translation-map (kbd "C-и")) (kbd "C-b")))
    (should (equal (lookup-key key-translation-map (kbd "C-с")) (kbd "C-c")))))

(ert-deftest key-translation-meta-map-test ()
  (let ((key-translation-map (make-sparse-keymap)))
    (key-translation-define-map "M-" "abc" "фис")
    (should (equal (lookup-key key-translation-map (kbd "M-ф")) (kbd "M-a")))
    (should (equal (lookup-key key-translation-map (kbd "M-и")) (kbd "M-b")))))

(ert-deftest key-translation-control-meta-map-test ()
  (let ((key-translation-map (make-sparse-keymap)))
    (key-translation-define-map "C-M-" "fn" "ан")
    (should (equal (lookup-key key-translation-map (kbd "C-M-а")) (kbd "C-M-f")))
    (should (equal (lookup-key key-translation-map (kbd "C-M-н")) (kbd "C-M-n")))))

(ert-deftest key-translation-shorter-source-test ()
  (let ((key-translation-map (make-sparse-keymap)))
    (key-translation-define-map "C-" "abcd" "фи")
    (should (equal (lookup-key key-translation-map (kbd "C-ф")) (kbd "C-a")))
    (should (equal (lookup-key key-translation-map (kbd "C-и")) (kbd "C-b")))))

(ert-deftest key-translation-russian-layout-test ()
  (let ((key-translation-map (make-sparse-keymap)))
    (key-translation-define-map "C-" "qwerty" "йцукен")
    (should (equal (lookup-key key-translation-map (kbd "C-й")) (kbd "C-q")))
    (should (equal (lookup-key key-translation-map (kbd "C-ц")) (kbd "C-w")))
    (should (equal (lookup-key key-translation-map (kbd "C-е")) (kbd "C-t")))
    (should (equal (lookup-key key-translation-map (kbd "C-н")) (kbd "C-y")))))

(provide 'key-translation-test)
;;; key-translation-test.el ends here
