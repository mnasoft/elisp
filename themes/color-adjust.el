;;; color-adjust.el --- HSV color adjustments -*- lexical-binding: t; -*-

;; Author: Mykola
;; Version: 0.1.0
;; Package-Requires: ((emacs "29.1"))
;; Keywords: faces

;;; Commentary:

;; Small library for adjusting Emacs colors in HSV space.
;; Hue is represented in radians, matching `color-rgb-to-hsv'.
;; Public functions:
;;
;;   `color-adjust-lighten'
;;   `color-adjust-darken'
;;   `color-adjust-saturate'
;;   `color-adjust-desaturate'

;;; Code:

(require 'color)

(defun color-adjust--hsv-to-rgb (h s v)
  "Convert HSV components H S V to normalized RGB.
H is in radians, matching `color-rgb-to-hsv'.
S and V are in the range 0.0 to 1.0."
  (let ((h (/ (mod h (* 2.0 float-pi)) (* 2.0 float-pi)))
        (s (min 1.0 (max 0.0 s)))
        (v (min 1.0 (max 0.0 v))))
    (if (zerop s)
        (list v v v)
      (let* ((position (* h 6.0))
             (sector (floor position))
             (fraction (- position sector))
             (p (* v (- 1.0 s)))
             (q (* v (- 1.0 (* s fraction))))
             (x (* v (- 1.0 (* s (- 1.0 fraction))))))
        (pcase sector
          (0 (list v x p))
          (1 (list q v p))
          (2 (list p v x))
          (3 (list p q v))
          (4 (list x p v))
          (_ (list v p q)))))))

(defun color-adjust--transform (color function)
  "Transform COLOR in HSV space using FUNCTION.
FUNCTION receives H, S and V and returns a list (H S V)."
  (let ((rgb (color-name-to-rgb color)))
    (unless rgb
      (error "Invalid color: %s" color))
    (pcase-let* ((`(,h ,s ,v) (apply #'color-rgb-to-hsv rgb))
                 (`(,h ,s ,v) (funcall function h s v)))
      (apply #'color-rgb-to-hex
             (append (color-adjust--hsv-to-rgb h s v) '(2))))))

(defun color-adjust-lighten (color percent)
  "Make COLOR PERCENT brighter by increasing HSV value."
  (color-adjust--transform
   color
   (lambda (h s v)
     (list h s (min 1.0 (* v (+ 1.0 (/ percent 100.0))))))))

(defun color-adjust-darken (color percent)
  "Make COLOR PERCENT darker by decreasing HSV value."
  (color-adjust-lighten color (- percent)))

(defun color-adjust-saturate (color percent)
  "Make COLOR PERCENT more saturated in HSV space."
  (color-adjust--transform
   color
   (lambda (h s v)
     (list h (min 1.0 (* s (+ 1.0 (/ percent 100.0)))) v))))

(defun color-adjust-desaturate (color percent)
  "Make COLOR PERCENT less saturated in HSV space."
  (color-adjust-saturate color (- percent)))

(provide 'color-adjust)

;;; color-adjust.el ends here
