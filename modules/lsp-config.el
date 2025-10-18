(use-package dap-mode
  :ensure t
  :bind
  ("C-x t" . dap-breakpoint-toggle)
  ("C-c c" . dap-continue)
  ("C-c i" . dap-step-in)
  ("C-c o" . dap-step-out)
  ("C-c n" . dap-next)
  ("C-c l" . dap-ui-locals)
  ("C-c d" . dap-debug-last)
  :config
  (require 'dap-mode)
  (require 'dap-utils)
  (require 'dap-php)
  (require 'dap-python)
  (require 'dap-node)
  (setq dap-python-debugger 'debugpy)
  (setq dap-ui-locals-expand-depth t)
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1))

(use-package lsp-mode
  :commands lsp
  :ensure t
  :init
  (require 'web-mode)
  (add-hook 'php-mode-hook #'lsp)
  (add-hook 'go-mode-hook 'lsp-deferred)
  (add-hook 'typescript-mode-hook 'lsp-deferred)
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-javascript-preferences-import-module-specifier "relative")
  (setq lsp-typescript-preferences-import-module-specifier "relative")
  (setq lsp-javascript-suggest-auto-imports nil)
  (setq lsp-javascript-suggest-paths nil)
  (add-hook 'web-mode-hook #'lsp-deferred)
  (add-hook 'go-mode-hook 'lsp-deferred)
  (add-to-list 'lsp-language-id-configuration '(".*\\.tsx$" . "html"))
  (setq lsp-file-watch-threshold 10000000)
  (setq lsp-intelephense-licence-key "00IXYCU0ORI7RQ7")
  (setq lsp-intelephense-files-associations ["*.php" "*.phtml" "*.module" "*.inc"]))


(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "basedpyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))

(provide 'lsp-config)
