;;;; ~/elisp/themes/color-adjust.el --- Adjust colors using RGB and HSV -*- lexical-binding: t; -*-

;; Author: Микола
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1"))
;; Keywords: faces
;; URL: https://github.com/USERNAME/color-adjust

;;; Commentary:

;; Small library for adjusting RGB/HSV colors.
;;
;; Public functions:
;;
;;   (my/color-adjust COLOR PERCENT)
;;   (lighten COLOR PERCENT)
;;   (darken COLOR PERCENT)
;;   (saturate COLOR PERCENT)
;;   (desaturate COLOR PERCENT)
;;
;; Example:
;;
;;   (lighten "#5f8580" 20)
;;   (darken "#5f8580" 20)
;;   (saturate "#5f8580" 20)
;;   (desaturate "#5f8580" 20)

;;; Code:

(require 'color)
(require 'cl-lib)

(defun my/color-adjust (color percent)
  "Изменить яркость COLOR на PERCENT процентов.

COLOR задаётся в формате \"#RRGGBB\".

Положительный PERCENT делает цвет ярче.
Отрицательный PERCENT делает цвет темнее.

Примеры:
  (my/color-adjust \"#5f8580\" 20)
  (my/color-adjust \"#5f8580\" -20)"
  (unless (string-match
           "\\`#\\([0-9a-fA-F]\\{2\\}\\)\\([0-9a-fA-F]\\{2\\}\\)\\([0-9a-fA-F]\\{2\\}\\)\\'"
           color)
    (error "Invalid color: %s" color))

  (let ((factor (+ 1.0 (/ percent 100.0))))
    (apply #'format "#%02x%02x%02x"
           (mapcar
            (lambda (component)
              (max 0
                   (min 255
                        (round (* component factor)))))
            (mapcar
             (lambda (n)
               (string-to-number (match-string n color) 16))
             '(1 2 3))))))

(defun my-color-rgb-to-hsv (r g b)
  "Преобразовать RGB в HSV.

Все компоненты находятся в диапазоне 0.0–1.0."
  (let* ((maximum (max r g b))
         (minimum (min r g b))
         (delta (- maximum minimum))
         (h 0.0)
         (s (if (zerop maximum)
                0.0
              (/ delta maximum)))
         (v maximum))
    (unless (zerop delta)
      (setq h
            (cond
             ((= maximum r)
              (/ (- g b) delta))
             ((= maximum g)
              (+ 2.0 (/ (- b r) delta)))
             (t
              (+ 4.0 (/ (- r g) delta)))))
      (setq h (/ h 6.0))
      (when (< h 0.0)
        (setq h (+ h 1.0))))
    (list h s v)))

(defun my-color-hsv-to-rgb (h s v)
  "Преобразовать HSV в RGB.

Все компоненты находятся в диапазоне 0.0–1.0."
  (if (zerop s)
      (list v v v)
    (let* ((position (* (mod h 1.0) 6.0))
           (sector (floor position))
           (fraction (- position sector))
           (p (* v (- 1.0 s)))
           (q (* v (- 1.0 (* s fraction))))
           (value-t (* v (- 1.0 (* s (- 1.0 fraction))))))
      (pcase sector
        (0 (list v value-t p))
        (1 (list q v p))
        (2 (list p v value-t))
        (3 (list p q v))
        (4 (list value-t p v))
        (_ (list v p q))))))

(defun my-color-hsv-transform (color function)
  "Преобразовать COLOR в HSV с помощью FUNCTION.

FUNCTION принимает H, S и V и возвращает список (H S V)."
  (pcase-let* ((`(,r ,g ,b) (color-name-to-rgb color))
               (`(,h ,s ,v) (my-color-rgb-to-hsv r g b))
               (`(,h ,s ,v) (funcall function h s v)))
    (apply #'color-rgb-to-hex
           (my-color-hsv-to-rgb h s v))))

(defun lighten (color percent)
  "Увеличить яркость COLOR на PERCENT процентов."
  (my-color-hsv-transform
   color
   (lambda (h s v)
     (list h s
           (min 1.0
                (* v (+ 1.0 (/ percent 100.0))))))))

(defun darken (color percent)
  "Уменьшить яркость COLOR на PERCENT процентов."
  (my-color-hsv-transform
   color
   (lambda (h s v)
     (list h s
           (max 0.0
                (* v (- 1.0
                        (/ (min percent 100.0) 100.0))))))))

(defun saturate (color percent)
  "Увеличить насыщенность COLOR на PERCENT процентов."
  (my-color-hsv-transform
   color
   (lambda (h s v)
     (list h
           (min 1.0
                (* s (+ 1.0 (/ percent 100.0))))
           v))))

(defun desaturate (color percent)
  "Уменьшить насыщенность COLOR на PERCENT процентов."
  (my-color-hsv-transform
   color
   (lambda (h s v)
     (list h
           (max 0.0
                (* s (- 1.0
                        (/ (min percent 100.0) 100.0))))
           v))))

(provide 'color-adjust)

;;; color-adjust.el ends here
