(require '_foreign)

;; https://github.com/jaypei/emacs-neotree
;; https://www.emacswiki.org/emacs/NeoTree
(@foreign/install-packages '(neotree))
(require 'neotree)

(global-set-key (kbd "<escape>") 'neotree-toggle)
(global-set-key (kbd "<S-escape>") 'neotree-stretch-toggle)

;; https://emacs.stackexchange.com/questions/37678/neotree-window-not-resizable

(setq neo-window-fixed-size nil)

;; Set the neo-window-width to the current width of the
;; neotree window, to trick neotree into resetting the
;; width back to the actual window width.
;; Fixes: https://github.com/jaypei/emacs-neotree/issues/262
(eval-after-load "neotree"
  '(add-to-list 'window-size-change-functions
				(lambda (frame)
				  (let ((neo-window (neo-global--get-window)))
					(unless (null neo-window)
					  (setq neo-window-width (window-width neo-window)))))))

(provide '_file-tree)
