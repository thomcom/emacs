;; -------------------------
;; Kevin Depue (2011)
;; Emacs configuration file.
;; -------------------------

;; lisp search paths
(add-to-list 'load-path "~/.emacs.d/")

;; basic settings
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(column-number-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode 0)
(show-paren-mode t)
(global-hl-line-mode t)
(global-auto-revert-mode 1)

;; tabs
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-default-style "k&r" c-basic-offset 4)

;; filling
(setq-default fill-column 80)

;; backups
(setq backup-by-copying t)
(setq backup-directory-alist `(("." . "~/.emacs.backups/")))
(setq auto-save-list-file-prefix "~/.emacs.backups/")
(setq auto-save-file-name-transforms `((".*" "~/.emacs.backups/" t)))

;; line numbers
;; (require 'linum)
;; (global-linum-mode t)

;; lua support
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-hook 'lua-mode-hook 'turn-on-font-lock)
(setq lua-indent-level 4)

;; ido mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(condition-case nil 
    (load-theme 'gams t) 
  (wrong-number-of-arguments 
   (load-theme 'gams)))

;; objective c
(setq auto-mode-alist (cons '("\\.mm$" . objc-mode) auto-mode-alist))

;; json
(require 'json-mode)

(setq auto-mode-alist (cons '("\\.json$" . json-mode) auto-mode-alist))

;; c mode
(setq c-basic-offset 4)
(setq c-default-style '((java-mode . "java") (awk-mode . "awk") (other . "bsd")))

;; clipboard support
(defun mac-copy ()
  (shell-command-to-string "pbpaste"))

(defun mac-paste (text &optional push)
  (let ((process-connection-type nil)) 
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'mac-paste)
(setq interprogram-paste-function 'mac-copy)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward uniquify-separator ":")

;; org mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; fullack
(add-to-list 'load-path "~/.emacs.d/full-ack")
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;; multiterm
(require 'multi-term)

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)
(ac-config-default)

;; maybe add ac-source-words-in-same-mode-buffers to
;; ac-sources. and for additional keywords maybe you want snippets?
;;          there's ac-source-yasnippet

;; (indent-relative &optional UNINDENTED-OK) 

;; (defun kill-this-line () (interactive) (kill-new (thing-at-point
;;        'line)))

