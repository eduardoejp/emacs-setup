(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)

(require '_auto-fill)
(add-hook 'emacs-lisp-mode-hook #'_auto-fill/none)
(remove-hook 'emacs-lisp-mode-hook #'turn-on-auto-fill)

(provide '_emacs-lisp)
