;; -------------------------
;; Kevin Depue (2012)
;; Emacs configuration file.
;; -------------------------

;; load path
(add-to-list 'load-path "~/.emacs.d/")

;; setup package
(require 'setup-package)

;; setup defaults
(require 'setup-defaults)

;; open marked files
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map "F" 'my-dired-find-file)
     (defun my-dired-find-file (&optional arg)
       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
       (interactive "P")
       (let* ((fn-list (dired-get-marked-files nil arg)))
         (mapc 'find-file fn-list)))))

;; find other file
(global-set-key (kbd "C-c o") (lambda () (interactive)
                                (ff-find-other-file t)))

;; backups
(setq backup-by-copying t)
(setq backup-directory-alist `(("." . "~/.emacs.backups/")))
(setq auto-save-list-file-prefix "~/.emacs.backups/")
(setq auto-save-file-name-transforms `((".*" "~/.emacs.backups/" t)))

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
  (wrong-number-of-arguments (load-theme 'gams)))

;; objective c
(setq auto-mode-alist (cons '("\\.mm$" . objc-mode) auto-mode-alist))

;; json
(require 'json-mode)
(setq auto-mode-alist (cons '("\\.json$" . json-mode) auto-mode-alist))

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
(setq org-startup-indented t)
(add-hook 'org-mode-hook
          (lambda ()
            (visual-line-mode t)
            (auto-fill-mode t))
          t)

;; fullack
(add-to-list 'load-path "~/.emacs.d/full-ack")
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)
(ac-config-default)

;; undo tree
(global-undo-tree-mode)

;; yasnippet
(setq yas-snippet-dirs "~/.emacs.d/snippets")
(yas-global-mode 1)
