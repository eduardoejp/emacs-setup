(require '_foreign)

;;;;;;;;;;;;;
;; Paredit ;;
;;;;;;;;;;;;;

;; https://github.com/emacsmirror/paredit
(@foreign/install-packages '(paredit))

;; https://emacs.stackexchange.com/questions/34873/how-to-set-the-region-selection-programmatically-in-emacs-lisp-using-indices
(defun _/set-region! (start end)
  (set-mark start)
  (goto-char end))

;; https://emacs.stackexchange.com/questions/36725/region-does-not-get-deselected-on-move-commands-using-push-mark-from-elisp
(defun _/mark-sexp! (direction)
  (progn
	(when (not (use-region-p))
	  (set-mark (point)))
	(setq transient-mark-mode (cons 'only transient-mark-mode))
	(forward-sexp direction)))

(defun _/mark-prev-sexp! ()
  (interactive)
  (_/mark-sexp! -1))

(defun _/mark-next-sexp! ()
  (interactive)
  (_/mark-sexp! 1))

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map [C-left] 'paredit-backward)
     (define-key paredit-mode-map [C-right] 'paredit-forward)
     (define-key paredit-mode-map [C-up] 'paredit-backward-up)
     (define-key paredit-mode-map [C-down] 'paredit-forward-down)
     (define-key paredit-mode-map [C-S-left] '_/mark-prev-sexp!)
     (define-key paredit-mode-map [C-S-right] '_/mark-next-sexp!)
     ))

;;;;;;;;;;;;;;;;;;;;;;;;
;; Rainbow delimiters ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; https://github.com/Fanael/rainbow-delimiters
(@foreign/install-packages '(rainbow-delimiters))

(custom-set-variables
 '(rainbow-delimiters-highlight-braces-p t)
 '(rainbow-delimiters-highlight-brackets-p t))
(custom-set-faces
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red3"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "DarkOrange3"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "gold3"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "chartreuse3"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "SpringGreen3"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "turquoise3"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "blue3"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "magenta3"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "DarkOrchid3"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "gray49")))))

(provide '_delimiters)
