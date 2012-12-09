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
(require 'setup-ido)
(require 'setup-ffip)

;; setup extensions
(require 'setup-undo-tree)

;; setup language extensions
(eval-after-load 'lua-mode '(require 'setup-lua-mode))

;; map file extensions to modes
(require 'mode-mappings)

;; (autoload 'lua-mode "lua-mode" "Lua editing mode." t)                                                                       ;; (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))                                                                      ;; (add-to-list 'interpreter-mode-alist '("lua" . lua-mode)) 

;; ;; objective c
;; (setq auto-mode-alist (cons '("\\.mm$" . objc-mode) auto-mode-alist))

;; ;; json
;; (require 'json-mode)
;; (setq auto-mode-alist (cons '("\\.json$" . json-mode) auto-mode-alist))

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

;; ;; org mode
;; (require 'org)
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; (setq org-startup-indented t)
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (visual-line-mode t)
;;             (auto-fill-mode t))
;;           t)

;; ;; fullack
;; (add-to-list 'load-path "~/.emacs.d/full-ack")
;; (autoload 'ack-same "full-ack" nil t)
;; (autoload 'ack "full-ack" nil t)
;; (autoload 'ack-find-same-file "full-ack" nil t)
;; (autoload 'ack-find-file "full-ack" nil t)

;; ;; auto-complete
;; (add-to-list 'load-path "~/.emacs.d/auto-complete/")
;; (require 'auto-complete-config)
;; (ac-config-default)

;; ;; yasnippet
;; (setq yas-snippet-dirs "~/.emacs.d/snippets")
;; (yas-global-mode 1)
