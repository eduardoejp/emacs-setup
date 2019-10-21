;; https://github.com/emacs-tw/awesome-emacs

;; https://emacs.stackexchange.com/questions/653/how-can-i-find-out-in-which-keymap-a-key-is-bound

;; http://wikemacs.org/wiki/Key_Bindings
;; http://ergoemacs.org/emacs/emacs_hyper_super_keys.html
;; https://askubuntu.com/questions/1133312/how-do-i-remap-caps-lock-to-hyper-key-in-ubuntu-18-04
;; https://www.reddit.com/r/emacs/comments/ao9y5k/using_meta_and_alt_in_emacs/
;; https://askubuntu.com/questions/423627/how-to-make-hyper-and-super-keys-not-do-the-same-thing

;; https://superuser.com/questions/471253/ubuntu-how-to-run-a-terminal-command-on-boot
;; http://upstart.ubuntu.com/getting-started.html

;;;;;;;;;;;;;;;;;;;;
;; Local packages ;;
;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/packages")

;;;;;;;;;;;
;; Setup ;;
;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/setup")

(require '_foreign)
(require '_shell)
(require '_buffer)
(require '_window)
(require '_scrolling)
(require '_fullscreen)
(require '_saving)
(require '_color-theme)
(require '_file-tree)
(require '_undo-redo)
(require '_style)
(require '_input)
(require '_usability)
(require '_delimiters)
(require '_javascript)
(require '_clojure)
(require '_emacs-lisp)
(require '_lux)
(require '_macro)

(require '_search)

(defvar lux-group "Lux")
(defvar lux-root (file-truename "~/lux"))

(defvar lux-stdlib-group (concat lux-group " | Standard library"))
(defvar lux-stdlib-root (concat lux-root "/stdlib"))

(defvar lux-lein-group (concat lux-group " | Leiningen plugin"))
(defvar lux-lein-root (concat lux-root "/lux-lein"))

(defvar lux-old-group (concat lux-group " | Old JVM compiler"))
(defvar lux-old-root (concat lux-root "/luxc"))

(defvar lux-jvm-group (concat lux-group " | JVM compiler"))
(defvar lux-jvm-root (concat lux-root "/new-luxc"))

(defvar reify-health-group "Reify Health")
(defvar reify-health-root (file-truename "~/workspace/Reify_Health"))

(defvar home-group "Home")
(defvar home-root (file-truename "~"))

(defvar emacs-group "Emacs")
(defvar emacs-root (file-truename "~/.emacs.d"))

;; https://github.com/ema2159/centaur-tabs
(@foreign/install-packages '(centaur-tabs))
(require 'centaur-tabs)

(centaur-tabs-mode t)
(global-set-key (kbd "C-<prior>") 'centaur-tabs-backward)
(global-set-key (kbd "C-<next>") 'centaur-tabs-forward)

(global-set-key (kbd "C-S-<prior>") 'centaur-tabs-move-current-tab-to-left)
(global-set-key (kbd "C-S-<next>") 'centaur-tabs-move-current-tab-to-right)

(setq centaur-tabs-style "bar")
(setq centaur-tabs-set-bar 'over)
(setq centaur-tabs-set-modified-marker t)
(setq centaur-tabs-cycle-scope 'tabs)

;; https://stackoverflow.com/questions/15717103/preferred-method-of-overriding-an-emacs-lisp-function
(defun centaur-tabs-get-group-name (buffer)
  (cond ((string-prefix-p lux-stdlib-root (buffer-file-name buffer))
         lux-stdlib-group)
		((string-prefix-p lux-lein-root (buffer-file-name buffer))
         lux-lein-group)
		((string-prefix-p lux-old-root (buffer-file-name buffer))
         lux-old-group)
		((string-prefix-p lux-jvm-root (buffer-file-name buffer))
         lux-jvm-group)
		((string-prefix-p lux-root (buffer-file-name buffer))
         lux-group)
        
        ((string-prefix-p reify-health-root (buffer-file-name buffer))
         reify-health-group)

		((string-prefix-p emacs-root (buffer-file-name buffer))
         emacs-group)
        
        (t
         home-group)))

;; http://emacs-fu.blogspot.com/2010/02/dealing-with-many-buffers-ibuffer.html
(require 'ibuffer) 
(setq ibuffer-saved-filter-groups
	  `(("default"
		 (,lux-stdlib-group
		  (filename . ,lux-stdlib-root))
		 (,lux-lein-group
		  (filename . ,lux-lein-root))
		 (,lux-old-group
		  (filename . ,lux-old-root))
		 (,lux-jvm-group
		  (filename . ,lux-jvm-root))
		 (,lux-group
		  (filename . ,lux-root))
		 
		 (,reify-health-group
		  (filename . ,reify-health-root))
		 
		 (,emacs-group
		  (filename . ,emacs-root))
		 )))

(add-hook 'ibuffer-mode-hook
		  (lambda ()
			(ibuffer-switch-to-saved-filter-groups "default")))

;; https://emacs.stackexchange.com/questions/2181/ibuffer-how-to-automatically-create-groups-per-project
(setq ibuffer-show-empty-filter-groups nil)

;; To get rid of menus and bars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Stack-traces...
(setq stack-trace-on-error t)

;;;;;;;;;;;;;
;; Back-up ;;
;;;;;;;;;;;;;

;; http://ergoemacs.org/emacs/emacs_set_backup_into_a_directory.html
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;;;;;;;;;;;;
;; CUSTOM ;;
;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(workgroups2 frame-local projectile ov s dash-functional dash)))
 '(rainbow-delimiters-highlight-braces-p t)
 '(rainbow-delimiters-highlight-brackets-p t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red3"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "DarkOrange3"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "gold3"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "chartreuse3"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "SpringGreen3"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "turquoise3"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "blue3"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "magenta3"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "DarkOrchid3"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "gray49")))))

;;;;;;;;;;
;; Init ;;
;;;;;;;;;;
(defun @/select-workspace ()
  (interactive)
  ;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Reading-One-Event.html
  (let ((choice (read-multiple-choice
                 "Workspace"
                 `((?l ,lux-group ,lux-root)
                   (?r ,reify-health-group ,reify-health-root)
                   (?e ,emacs-group ,emacs-root)
				   (?h ,home-group ,home-root)
                   ))))
    ;; https://www.emacswiki.org/emacs/NeoTree#toc11
    (neotree-dir (caddr choice))
    (neotree-show)))

(define-key global-map (kbd "H-2") #'@/select-workspace)

(defun @/initialize ()
  (neotree-dir lux-root)
  (delete-window))

(add-hook 'after-init-hook #'@/initialize)

(put 'erase-buffer 'disabled nil)
