;; http://web.mit.edu/Emacs/source/emacs/lisp/ibuffer.el
(setq ibuffer-default-sorting-mode 'filename/process)

(defun xah-ibuffer-keys ()
  (local-set-key (kbd "<down-mouse-1>") 'ibuffer-mouse-visit-buffer))

(add-hook 'ibuffer-hook 'xah-ibuffer-keys)

(defun _/kill-current-buffer! ()
  (interactive)
  (kill-buffer (current-buffer)))

(define-key global-map (kbd "<s-return>") 'ibuffer)
(define-key global-map (kbd "<s-delete>") '_/kill-current-buffer!)

(global-set-key (kbd "<M-prior>") 'previous-buffer)
(global-set-key (kbd "<M-next>") 'next-buffer)

(provide '_buffer)
