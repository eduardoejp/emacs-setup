;; Don't show passwords on shell-mode
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

(defconst _/shell-prefix "shell#")

(defvar _/*shell-number* 0)

(defun _/spawn-shell! (name)
  "Opens a shell and asks for an unique name."
  (interactive "sShell Name: ")
  (if (string= "" name)
	  (progn
		(shell (concat _/shell-prefix (number-to-string _/*shell-number*)))
		(setq _/*shell-number* (+ _/*shell-number* 1)))
    (shell (concat _/shell-prefix name))))

(define-key global-map (kbd "H-4") '_/spawn-shell!)

;; https://github.com/syl20bnr/spacemacs/issues/6820#issuecomment-239665146
(push (cons _/shell-prefix
			display-buffer--same-window-action)
	  display-buffer-alist)

(provide '_shell)
