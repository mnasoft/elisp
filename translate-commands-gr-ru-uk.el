;;;; /home/namatv/elisp/translate-commands-gr-ru-uk.el
(setq *abc-ru-eng* (list "йцукенгшщзхъфывапролджэ\ячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖ\ЭЯЧСМИТЬБЮ№"
			 "qwertyuiop[]asdfghjkl;'\zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"))

(setq *abc-gr-eng* (list  ";ςερτυθιοπασδφγηξκλζχψωβνμΣΕΡΤΥΘΙΟΠΑΣΔΦΓΗΞΚΛΖΧΨΩΒΝΜ"
			  "qwertyuiopasdfghjklzxcvbnmWERTYUIOPASDFGHJKLZXCVBNM"))

(setq *abc-ua-eng* (list  "йцукенгшщзхїфівапролджєґячсмитьбюЙЦУКЕНГШЩЗХЇФІВАПРОЛДЖЄҐЯЧСМИТЬБЮ№"
			  "qwertyuiop[]asdfghjkl;'\zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"))

(defun first (lst)
  (car lst))

(defun second (lst)
  (cadr lst))

(defun string->list (str) 
  (mapcar 'char-to-string (append str nil)))

;;(defun define-key-translation-map (prefix to from)
;;  (seq-mapn
;;   '(lambda (el1 el2)
;;      (define-key-translation prefix el1 el2))
;;   (string->list to)
;;   (string->list from)))

(defun concatenate (seq-1 seq-2)
  (let ((s-1 seq-1)
	(s-2 seq-2)
	(rez nil)
	)
    (while (and s-1 s-2)
      (push (list (car s-1) (car s-2)) rez)
      (setq s-1 (cdr s-1))
      (setq s-2 (cdr s-2)))
    rez))

(defun define-key-translation-map (prefix to from)
  (mapc
   '(lambda (el)
      (define-key-translation prefix (first el) (second el)))
   (concatenate (string->list to) (string->list from))))

(defun kbd-ctrl-meta-ctrlmeta-binding (str-to str-from)
  (define-key-translation-map "C-"       str-to str-from)
  (define-key-translation-map "M-"       str-to str-from)
  (define-key-translation-map "C-M-"     str-to str-from)
  (define-key-translation-map "C-x "     str-to str-from)
  (define-key-translation-map "C-c C-d " str-to str-from)
  (define-key-translation-map "C-h "     str-to str-from)
  )

(defun define-key-translation (prefix to from) 
  (define-key key-translation-map
    (kbd (concat prefix from))
    (kbd (concat prefix to))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key-translation-map "C-M-"     "N" "F")
(define-key-translation-map "C-M-"     "n" "f")

(kbd-ctrl-meta-ctrlmeta-binding (second *abc-ru-eng*) (first  *abc-ru-eng*))
