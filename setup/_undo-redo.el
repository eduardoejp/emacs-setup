;; https://www.emacswiki.org/emacs/RedoMode
(require 'redo+)

(define-key global-map (kbd "C-z") 'undo)
(define-key global-map (kbd "C-S-z") 'redo) ; Depends on the redo.el package...

(provide '_undo-redo)
