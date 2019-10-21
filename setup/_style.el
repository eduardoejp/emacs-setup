;; https://emacs.stackexchange.com/questions/2999/how-to-maximize-my-emacs-frame-on-start-up
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

;; Line-numbers on the margins of my buffers
(global-linum-mode 1)

;; Line & column numbering
(line-number-mode 1)
(column-number-mode 1)

;; Automatic indentation
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Different cursor shapes & colors for different input modes
; valid values are t, nil, box, hollow, bar, (bar . WIDTH), hbar,
; (hbar. HEIGHT); see the docs for set-cursor-type
(defun djcb-set-cursor-according-to-mode ()
  "change cursor color and type according to some minor modes."
  (cond
    (buffer-read-only
      (set-cursor-color "gray")
      (setq cursor-type 'hbar))
    (overwrite-mode
      (set-cursor-color "red")
      (setq cursor-type 'box))
    (t 
      (set-cursor-color "yellow")
      (setq cursor-type 'bar))))

(add-hook 'post-command-hook 'djcb-set-cursor-according-to-mode)

;; Emacs zooming with scrollbar
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)

(provide '_style)
