;; Long-line truncating.
(setq-default truncate-lines t)
(setq hscroll-step 1)

;;;;;;;;;;;;;;
;; CUA mode ;;
;;;;;;;;;;;;;;

;; https://www.emacswiki.org/emacs/CuaMode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

(define-key global-map "\C-s" 'save-buffer)

;;;;;;;;;;;;;;;;;;;;;;;
;; PC-selection mode ;;
;;;;;;;;;;;;;;;;;;;;;;;

;; https://www.emacswiki.org/emacs/PcSelectionMode

;; Unset a few unnecesary key-bindings (they'll clash with pc-selection-mode...)
(dolist (key '([S-left] [S-right] [S-up] [S-down] [S-home] [S-end] [S-next] [S-prior]))
  (global-unset-key key))

;; Needed for (correct) shift-selection
(setq pc-selection-mode t) ; This would be the alternative -> (setq shift-select-mode t)
;; (setq shift-select-mode t)

;; https://www.emacswiki.org/emacs/DeleteSelectionMode
(delete-selection-mode 1)

(defun _/erase! ()
  (interactive)
  (cond ((use-region-p)
		 ;; https://stackoverflow.com/questions/26248236/emacs-paredit-mode-how-to-correct-unbalanced-parenthesis-in-yanked-code
		 ;; https://stackoverflow.com/questions/637351/emacs-how-to-delete-text-without-kill-ring
		 (delete-region (region-beginning) (region-end)))
		
		;; https://stackoverflow.com/questions/10088168/how-to-check-whether-a-minor-mode-e-g-flymake-mode-is-on
		((and (boundp 'paredit-mode)
			  paredit-mode)
		 (paredit-backward-delete))
		
		(t
		 ;; https://www.emacswiki.org/emacs/BackspaceKey
		 (delete-backward-char 1))))

(global-set-key [backspace] '_/erase!)

(defun _/smart-beginning-of-line ()
  "Moves point to first non-whitespace character or beginning-of-line.
Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive "") ; Use (interactive "^") in Emacs 23 to make shift-select work
  ;; (setq shift-select-mode t)
  (handle-shift-selection)
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line)))
  ;; (setq shift-select-mode nil)
  )

(global-set-key [home] '_/smart-beginning-of-line)

(provide '_usability)
