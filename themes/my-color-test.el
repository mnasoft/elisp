;;; my-color-test.el --- Tests for my-color -*- lexical-binding: t; -*-

(require 'ert)
(require 'cl-lib)
(require 'my-color)


;;;; Средства сравнения

(defconst my-color-test-epsilon 1e-12)

(defun my-color-test-number= (a b)
  "Проверить приблизительное равенство чисел A и B."
  (< (abs (- a b))
     my-color-test-epsilon))

(defun my-color-test-list= (actual expected)
  "Проверить приблизительное равенство списков чисел."
  (and (= (length actual)
          (length expected))
       (cl-every #'my-color-test-number=
                 actual expected)))


;;;; RGB -> HSV

(ert-deftest my-color-rgb-to-hsv-primary-colors ()
  (should
   (my-color-test-list=
    (my-color-rgb-to-hsv 1.0 0.0 0.0)
    '(0.0 1.0 1.0)))

  (should
   (my-color-test-list=
    (my-color-rgb-to-hsv 0.0 1.0 0.0)
    (list (/ 1.0 3.0) 1.0 1.0)))

  (should
   (my-color-test-list=
    (my-color-rgb-to-hsv 0.0 0.0 1.0)
    (list (/ 2.0 3.0) 1.0 1.0))))


(ert-deftest my-color-rgb-to-hsv-achromatic-colors ()
  (should
   (my-color-test-list=
    (my-color-rgb-to-hsv 0.0 0.0 0.0)
    '(0.0 0.0 0.0)))

  (should
   (my-color-test-list=
    (my-color-rgb-to-hsv 1.0 1.0 1.0)
    '(0.0 0.0 1.0)))

  (should
   (my-color-test-list=
    (my-color-rgb-to-hsv 0.5 0.5 0.5)
    '(0.0 0.0 0.5))))


;;;; HSV -> RGB

(ert-deftest my-color-hsv-to-rgb-primary-colors ()
  (should
   (my-color-test-list=
    (my-color-hsv-to-rgb 0.0 1.0 1.0)
    '(1.0 0.0 0.0)))

  (should
   (my-color-test-list=
    (my-color-hsv-to-rgb (/ 1.0 3.0) 1.0 1.0)
    '(0.0 1.0 0.0)))

  (should
   (my-color-test-list=
    (my-color-hsv-to-rgb (/ 2.0 3.0) 1.0 1.0)
    '(0.0 0.0 1.0))))


(ert-deftest my-color-hsv-to-rgb-achromatic-colors ()
  (should
   (my-color-test-list=
    (my-color-hsv-to-rgb 0.75 0.0 0.5)
    '(0.5 0.5 0.5))))


;;;; Проверка всех шести секторов HSV

(ert-deftest my-color-hsv-six-sectors ()
  (dolist (h '(0.0
               (/ 1.0 6.0)
               (/ 2.0 6.0)
               (/ 3.0 6.0)
               (/ 4.0 6.0)
               (/ 5.0 6.0)))
    (let* ((rgb (my-color-hsv-to-rgb h 0.6 0.8))
           (hsv (apply #'my-color-rgb-to-hsv rgb)))
      (should
       (my-color-test-list=
        hsv
        (list h 0.6 0.8))))))


;;;; RGB -> HSV -> RGB

(ert-deftest my-color-rgb-hsv-roundtrip ()
  (dolist (rgb '((0.0 0.0 0.0)
                 (1.0 1.0 1.0)
                 (1.0 0.0 0.0)
                 (0.0 1.0 0.0)
                 (0.0 0.0 1.0)
                 (0.2 0.4 0.6)
                 (0.37 0.52 0.50)
                 (0.9 0.3 0.7)))
    (should
     (my-color-test-list=
      (apply #'my-color-hsv-to-rgb
             (apply #'my-color-rgb-to-hsv rgb))
      rgb))))


;;;; Чистые HSV-преобразования

(ert-deftest my-color-adjust-value-test ()
  (should
   (my-color-test-list=
    (my-color-adjust-value '(0.4 0.5 0.6) 20)
    '(0.4 0.5 0.72)))

  (should
   (my-color-test-list=
    (my-color-adjust-value '(0.4 0.5 0.6) -20)
    '(0.4 0.5 0.48))))


(ert-deftest my-color-adjust-saturation-test ()
  (should
   (my-color-test-list=
    (my-color-adjust-saturation '(0.4 0.5 0.6) 20)
    '(0.4 0.6 0.6)))

  (should
   (my-color-test-list=
    (my-color-adjust-saturation '(0.4 0.5 0.6) -20)
    '(0.4 0.4 0.6))))


;;;; Ограничение диапазона

(ert-deftest my-color-adjustment-clamping-test ()
  (should
   (equal
    (my-color-adjust-value '(0.4 0.5 0.9) 100)
    '(0.4 0.5 1.0)))

  (should
   (equal
    (my-color-adjust-value '(0.4 0.5 0.9) -200)
    '(0.4 0.5 0.0)))

  (should
   (equal
    (my-color-adjust-saturation '(0.4 0.9 0.7) 100)
    '(0.4 1.0 0.7)))

  (should
   (equal
    (my-color-adjust-saturation '(0.4 0.9 0.7) -200)
    '(0.4 0.0 0.7))))


;;;; Публичный интерфейс

(ert-deftest my-color-public-transformations-test ()
  (should (equal (lighten "#5f8580" 10)
                 "#69928d"))

  (should (equal (darken "#5f8580" 10)
                 "#567873"))

  (should (equal (saturate "#5f8580" 10)
                 "#5b8580"))

  (should (equal (desaturate "#5f8580" 10)
                 "#638580")))


;;;; Ошибки

(ert-deftest my-color-invalid-color-test ()
  (should-error
   (my-color-to-hsv "not-a-real-color")
   :type 'error))


(provide 'my-color-test)

;;; my-color-test.el ends here
