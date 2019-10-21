(defun _/toggle-fullscreen! ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(define-key global-map [f11] '_/toggle-fullscreen!)

(provide '_fullscreen)
