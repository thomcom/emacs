;; lua
(autoload 'lua-mode "lua-mode")
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; json
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))

(provide 'mode-mappings)
