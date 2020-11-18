;; https://emacs.stackexchange.com/questions/38780/cua-mode-and-keyboard-macros

;; fix problem of cua-mode and macro
;; fix function 
(defun cua-macro-fix () 
  (kmacro-edit-macro)
  ;; fix the C-c C-c 
  (goto-char (point-min))
  (forward-line 7)
  (while (search-forward "C-c C-c" nil t)
    (replace-match "C-c"))
  ;; fix the C-x C-x 
  (goto-char (point-min))
  (forward-line 7)
  (while (search-forward "C-x C-x" nil t)
    (replace-match "C-x"))
  (edmacro-finish-edit))

;;bind the two functions
(defun end-kbd-macro-with-fix ()
  (interactive)
  (if defining-kbd-macro
	  (progn
		(end-kbd-macro)
		(cua-macro-fix))
	(kmacro-call-macro 1)))

;; bind the function to F4
(global-set-key (kbd "<f4>") 'end-kbd-macro-with-fix)

(define-key global-map (kbd "<H-return>") 'kmacro-start-macro-or-insert-counter)
(define-key global-map (kbd "<H-SPC>") 'end-kbd-macro-with-fix)

(provide '_macro)
