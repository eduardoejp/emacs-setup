;; https://emacs.stackexchange.com/questions/47584/what-is-the-difference-between-refill-mode-and-auto-fill-mode-in-emacs

(defun _auto-fill/disable! ()
  ;; https://stackoverflow.com/questions/9878623/how-can-i-disable-auto-fill-mode-in-emacs
  (auto-fill-mode -1))

(defun _auto-fill/none ()
  "Takes away auto-fill-mode from hooked modes."
  (interactive)
  (_auto-fill/disable!))

(_auto-fill/disable!)

(provide '_auto-fill)
