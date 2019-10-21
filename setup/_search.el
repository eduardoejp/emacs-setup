(require '_foreign)

;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Controlling-case-sensitivity.html
(setq case-fold-search nil) ; make searches case sensitive

;; https://github.com/syohex/emacs-anzu
(@foreign/install-packages '(anzu))
(global-anzu-mode +1)

(define-key global-map (kbd "M-[") 'isearch-forward-regexp)
(define-key global-map (kbd "M-]") 'anzu-query-replace)

;; https://stackoverflow.com/questions/18157602/emacs-key-binding-for-isearch-forward
(define-key isearch-mode-map (kbd "<prior>") 'isearch-repeat-backward)
(define-key isearch-mode-map (kbd "<next>") 'isearch-repeat-forward)

;; https://www.reddit.com/r/emacs/comments/b7yjje/isearch_region_search/
(defun _/isearch-region (&optional not-regexp no-recursive-edit)
  "If a region is active, make this the isearch default search pattern."
  (interactive "P\np")
  (when (use-region-p)
    (let ((search (buffer-substring-no-properties
                   (region-beginning)
                   (region-end))))
      (message "_/isearch-region: %s %d %d" search (region-beginning) (region-end))
      (setq deactivate-mark t)
	  ;; https://groups.google.com/forum/#!msg/gnu.emacs.help/E5S-9mO5qq0/wJPvSnw-_64J
	  (isearch-toggle-case-fold)
      (isearch-yank-string search))))

(advice-add 'isearch-forward-regexp :after '_/isearch-region)
(advice-add 'isearch-forward :after '_/isearch-region)

(provide '_search)
