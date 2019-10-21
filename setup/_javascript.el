(setq js-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.js(on)?$" . javascript-mode))

(require 'paredit)
(add-hook 'js-mode-hook #'paredit-mode)

(require 'rainbow-delimiters)
(add-hook 'js-mode-hook #'rainbow-delimiters-mode)

(require '_auto-fill)
(add-hook 'js-mode-hook #'_auto-fill/none)

(provide '_javascript)
