;;; color-adjust-test.el --- Tests for color-adjust -*- lexical-binding: t; -*-

(require 'ert)
(require 'color-adjust)

(defconst color-adjust-test--epsilon 1e-10)

(defun color-adjust-test--near-p (a b)
  (< (abs (- a b)) color-adjust-test--epsilon))

(defun color-adjust-test--rgb-near-p (a b)
  (seq-every-p #'identity
               (seq-mapn #'color-adjust-test--near-p a b)))

(ert-deftest color-adjust-hsv-rgb-roundtrip ()
  (dolist (rgb '((1.0 0.0 0.0)
                 (0.0 1.0 0.0)
                 (0.0 0.0 1.0)
                 (0.5 0.5 0.5)
                 (0.37 0.52 0.50)
                 (0.9 0.3 0.7)))
    (let* ((hsv (apply #'color-rgb-to-hsv rgb))
           (result (apply #'color-adjust--hsv-to-rgb hsv)))
      (should (color-adjust-test--rgb-near-p rgb result)))))

(ert-deftest color-adjust-achromatic-hsv-to-rgb ()
  (should (color-adjust-test--rgb-near-p
           (color-adjust--hsv-to-rgb 1.7 0.0 0.5)
           '(0.5 0.5 0.5))))

(ert-deftest color-adjust-lighten-test ()
  (let* ((before (apply #'color-rgb-to-hsv (color-name-to-rgb "#5f8580")))
         (after (apply #'color-rgb-to-hsv
                       (color-name-to-rgb
                        (color-adjust-lighten "#5f8580" 10)))))
    (should (> (nth 2 after) (nth 2 before)))))

(ert-deftest color-adjust-darken-test ()
  (let* ((before (apply #'color-rgb-to-hsv (color-name-to-rgb "#5f8580")))
         (after (apply #'color-rgb-to-hsv
                       (color-name-to-rgb
                        (color-adjust-darken "#5f8580" 10)))))
    (should (< (nth 2 after) (nth 2 before)))))

(ert-deftest color-adjust-saturate-test ()
  (let* ((before (apply #'color-rgb-to-hsv (color-name-to-rgb "#5f8580")))
         (after (apply #'color-rgb-to-hsv
                       (color-name-to-rgb
                        (color-adjust-saturate "#5f8580" 10)))))
    (should (> (nth 1 after) (nth 1 before)))))

(ert-deftest color-adjust-desaturate-test ()
  (let* ((before (apply #'color-rgb-to-hsv (color-name-to-rgb "#5f8580")))
         (after (apply #'color-rgb-to-hsv
                       (color-name-to-rgb
                        (color-adjust-desaturate "#5f8580" 10)))))
    (should (< (nth 1 after) (nth 1 before)))))

(ert-deftest color-adjust-invalid-color-test ()
  (should-error (color-adjust-lighten "definitely-not-a-color" 10)))

(provide 'color-adjust-test)

;;; color-adjust-test.el ends here
