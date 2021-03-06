(fset 'yes-or-no-p 'y-or-n-p)

;; Automatic indentation
(define-key global-map (kbd "RET") 'newline-and-indent)

(define-key global-map (kbd "<C-escape>") 'keyboard-quit)

(setq-default tab-width 4)

(define-key key-translation-map (kbd "1") (kbd "!"))
(define-key key-translation-map (kbd "2") (kbd "@"))
(define-key key-translation-map (kbd "3") (kbd "#"))
(define-key key-translation-map (kbd "4") (kbd "$"))
(define-key key-translation-map (kbd "5") (kbd "%"))
(define-key key-translation-map (kbd "6") (kbd "^"))
(define-key key-translation-map (kbd "7") (kbd "&"))
(define-key key-translation-map (kbd "8") (kbd "*"))
(define-key key-translation-map (kbd "9") (kbd "("))
(define-key key-translation-map (kbd "0") (kbd ")"))
(define-key key-translation-map (kbd "`") (kbd "~"))
(define-key key-translation-map (kbd ";") (kbd ":"))
(define-key key-translation-map (kbd "'") (kbd "\""))

(define-key key-translation-map (kbd "!") (kbd "1"))
(define-key key-translation-map (kbd "@") (kbd "2"))
(define-key key-translation-map (kbd "#") (kbd "3"))
(define-key key-translation-map (kbd "$") (kbd "4"))
(define-key key-translation-map (kbd "%") (kbd "5"))
(define-key key-translation-map (kbd "^") (kbd "6"))
(define-key key-translation-map (kbd "&") (kbd "7"))
(define-key key-translation-map (kbd "*") (kbd "8"))
(define-key key-translation-map (kbd "(") (kbd "9"))
(define-key key-translation-map (kbd ")") (kbd "0"))
(define-key key-translation-map (kbd "~") (kbd "`"))
(define-key key-translation-map (kbd ":") (kbd ";"))
(define-key key-translation-map (kbd "\"") (kbd "'"))

(provide '_input)
