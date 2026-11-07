;;; key-translation.el --- Keyboard translation helpers -*- lexical-binding: t; -*-

;; Author: Mykola
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1"))
;; Keywords: convenience, keyboard

;;; Commentary:
;; Translate modified keystrokes from non-English keyboard layouts
;; to their corresponding English-layout keys.

;;; Code:

(require 'cl-lib)

(defconst key-translation--ru
  '("йцукенгшщзхъфывапролджэ\\ячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖ\\ЭЯЧСМИТЬБЮ№"
    "qwertyuiop[]asdfghjkl;'\\zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"))

(defconst key-translation--gr
  '(";ςερτυθιοπασδφγηξκλζχψωβνμΣΕΡΤΥΘΙΟΠΑΣΔΦΓΗΞΚΛΖΧΨΩΒΝΜ"
    "qwertyuiopasdfghjklzxcvbnmWERTYUIOPASDFGHJKLZXCVBNM"))

(defconst key-translation--uk
  '("йцукенгшщзхїфівапролджєґячсмитьбюЙЦУКЕНГШЩЗХЇФІВАПРОЛДЖЄҐЯЧСМИТЬБЮ№"
    "qwertyuiop[]asdfghjkl;'\\zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"))

(defun key-translation-define (prefix to from)
  "Translate FROM to TO with key PREFIX."
  (define-key key-translation-map
    (kbd (concat prefix from))
    (kbd (concat prefix to))))

(defun key-translation-define-map (prefix to from)
  "Translate characters in FROM to corresponding characters in TO."
  (cl-loop for to-char across to
           for from-char across from
           do (key-translation-define
               prefix
               (char-to-string to-char)
               (char-to-string from-char))))

(defun key-translation-define-bindings (to from)
  "Install translations from FROM to TO for common Emacs prefixes."
  (cl-loop for prefix in '("C-" "M-" "C-M-" "C-x " "C-c C-d " "C-h ")
           do (key-translation-define-map prefix to from)))

(defun key-translation-enable-russian ()
  "Enable translations for the Russian keyboard layout."
  (interactive)
  (key-translation-define-bindings
   (cadr key-translation--ru) (car key-translation--ru)))

(defun key-translation-enable-ukrainian ()
  "Enable translations for the Ukrainian keyboard layout."
  (interactive)
  (key-translation-define-bindings
   (cadr key-translation--uk) (car key-translation--uk)))

(defun key-translation-enable-greek ()
  "Enable translations for the Greek keyboard layout."
  (interactive)
  (key-translation-define-bindings
   (cadr key-translation--gr) (car key-translation--gr)))

;; Preserve the behavior of the original configuration.
(key-translation-define-map "C-M-" "N" "F")
(key-translation-define-map "C-M-" "n" "f")
(key-translation-enable-russian)

(provide 'key-translation)

;;; key-translation.el ends here
