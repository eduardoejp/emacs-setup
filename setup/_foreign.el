(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defun @foreign/install-packages (packages)
  (dolist (package packages)
    (when (not (package-installed-p package))
      (package-install package))))

(provide '_foreign)
