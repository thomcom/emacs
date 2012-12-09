(require 'package)

(defvar marmalade '("marmalade" . "http://marmalade-repo.org/packages/"))

;; marmalade
(add-to-list 'package-archives marmalade)

(package-initialize)

;; refresh package list if you never have
(unless (file-exists-p "~/.emacs.d/elpa/archives/marmalade")
  (package-refresh-contents))

;; courtesy of magnars: install a list of packages
(defun packages-install (&rest packages)
  (mapc (lambda (package)
          (let ((name (car package))
                (repo (cdr package)))
            (when (not (package-installed-p name))
              (let ((package-archives (list repo)))
                (package-initialize)
                (package-install name)))))
        packages)
  (package-initialize)
  (delete-other-windows))

(provide 'setup-package)
