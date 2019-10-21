(defun _/save-all-buffers! ()
  "Saves all buffers without bugging the user."
  (interactive)
  (save-some-buffers t)
  (message "Saved all buffers!"))

(define-key global-map "\C-s" 'save-buffer)
(define-key global-map (kbd "C-S-s") '_/save-all-buffers!)

(provide '_saving)
