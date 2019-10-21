;; https://github.com/LuxLang/lux/tree/master/lux-mode
(require 'lux-mode)

(add-to-list 'auto-mode-alist '("\\.lux$" . lux-mode))

(require 'paredit)
(add-hook 'lux-mode-hook #'paredit-mode)

(require 'rainbow-delimiters)
(add-hook 'lux-mode-hook #'rainbow-delimiters-mode)

(require '_auto-fill)
(add-hook 'lux-mode-hook #'_auto-fill/none)
(remove-hook 'lux-mode-hook #'turn-on-auto-fill)

(provide '_lux)
