;; -------------------------
;; Kevin Depue (2012)
;; Emacs configuration file.
;; -------------------------

;; load path
(add-to-list 'load-path "~/.emacs.d/")

;; setup package
(require 'setup-package)

;; install missing extensions
(defun init--install-packages ()
  (packages-install
   (cons 'undo-tree marmalade)
   (cons 'lua-mode marmalade)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; setup customizations
(require 'setup-defaults)
(require 'setup-theme)
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'org '(require 'setup-org))
(require 'setup-ido)
(require 'setup-ffip)

;; setup extensions
(require 'setup-undo-tree)

;; setup language extensions
(eval-after-load 'lua-mode '(require 'setup-lua))

;; map file extensions to modes
(require 'mode-mappings)

;; ;; clipboard support
;; (defun mac-copy ()
;;   (shell-command-to-string "pbpaste"))

;; (defun mac-paste (text &optional push)
;;   (let ((process-connection-type nil)) 
;;     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;;       (process-send-string proc text)
;;       (process-send-eof proc))))

;; (setq interprogram-cut-function 'mac-paste)
;; (setq interprogram-paste-function 'mac-copy)

;; ;; uniquify
;; (require 'uniquify)
;; (setq uniquify-buffer-name-style 'post-forward uniquify-separator ":")

;; ;; auto-complete
;; (add-to-list 'load-path "~/.emacs.d/auto-complete/")
;; (require 'auto-complete-config)
;; (ac-config-default)

;; ;; yasnippet
;; (setq yas-snippet-dirs "~/.emacs.d/snippets")
;; (yas-global-mode 1)
