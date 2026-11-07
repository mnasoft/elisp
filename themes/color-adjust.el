;;;; ~/elisp/themes/color-adjust.el -*- lexical-binding: t; -*-

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
