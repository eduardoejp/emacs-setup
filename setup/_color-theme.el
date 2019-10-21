(require '_foreign)

;; https://pawelbx.github.io/emacs-theme-gallery/
;; https://www.reddit.com/r/emacs/comments/33be65/light_color_theme_recommendations/

;; https://github.com/chriskempson/tomorrow-theme
;(require 'color-theme-tomorrow)
;(color-theme-tomorrow--define-theme day)
;(color-theme-tomorrow--define-theme night)

;; https://github.com/kuanyui/moe-theme.el
(@foreign/install-packages '(moe-theme))
(require 'moe-theme)
;(moe-light)
(moe-dark)

(provide '_color-theme)
