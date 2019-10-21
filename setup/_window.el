;; http://ergoemacs.org/emacs/emacs_split_windows.html

;; Creation
(define-key global-map (kbd "s--") 'split-window-below)
(define-key global-map (kbd "s-\\") 'split-window-right)

;; Deletion
(define-key global-map [s-backspace] 'delete-window)
(define-key global-map [s-M-backspace] 'delete-other-windows)

;; Navigation
(defun _/prev-window! ()
  (interactive)
  (other-window -1))

(defun _/next-window! ()
  (interactive)
  (other-window 1))

(global-set-key (kbd "s-,") '_/prev-window!)
(global-set-key (kbd "s-.") '_/next-window!)

;; https://www.emacswiki.org/emacs/WindMove
(require 'windmove)

(defun ignore-error-wrapper (fn)
  "Funtion return new function that ignore errors.
   The function wraps a function with `ignore-errors' macro."
  (lambda ()
    (interactive)
    (ignore-errors
      (funcall fn))))

(defun _/windmove-up ()
  (interactive)
  (ignore-errors
    (windmove-up)))

(defun _/windmove-down ()
  (interactive)
  (ignore-errors
    (windmove-down)))

(defun _/windmove-left ()
  (interactive)
  (ignore-errors
    (windmove-left)))

(defun _/windmove-right ()
  (interactive)
  (ignore-errors
    (windmove-right)))

(global-set-key (kbd "<M-up>") '_/windmove-up)
(global-set-key (kbd "<M-down>") '_/windmove-down)
(global-set-key (kbd "<M-left>") '_/windmove-left)
(global-set-key (kbd "<M-right>") '_/windmove-right)

(provide '_window)
