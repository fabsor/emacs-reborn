(use-package dap-mode
  :ensure t
  :bind
  ("C-x t" . dap-breakpoint-toggle)
  ("C-c c" . dap-continue)
  ("C-c i" . dap-step-in)
  ("C-c o" . dap-step-out)
  ("C-c n" . dap-next)
  ("C-c l" . dap-ui-locals)
  :config
  (require 'dap-mode)
  (require 'dap-utils)  
  (require 'dap-php)
  (dap-mode 1)
  (dap-ui-mode 1)
  (setq lsp-enable-file-watchers t)
  (setq lsp-file-watch-threshold 1000000)
  (setq lsp-intelephense-files-associations '("*.php" "*.phptml" "*.module" "*.inc"))
  (dap-tooltip-mode 1)
  (tooltip-mode 1))

 (use-package lsp-mode
   :commands lsp
   :ensure t
   :init
   (add-hook 'php-mode-hook #'lsp)
   )



(provide 'lsp-config)
