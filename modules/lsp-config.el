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
  (setq dap-python-debugger 'debugpy)
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1))

(use-package lsp-mode
  :commands lsp
  :ensure t
  :init
  (require 'web-mode)
  (require 'flycheck-phpstan)
  (add-hook 'php-mode-hook #'lsp)
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (add-hook 'web-mode #'lsp)
  (add-to-list 'lsp-language-id-configuration '(".*\\.tsx$" . "html"))
  (defun php-lsp-flycheck ()
    (flycheck-mode t)
    (flycheck-add-next-checker 'lsp 'phpstan))
  (add-hook 'lsp-after-open-hook  'php-lsp-flycheck)
  (setq lsp-file-watch-threshold 10000000)
  (setq lsp-intelephense-licence-key "00IXYCU0ORI7RQ7")
  (setq lsp-intelephense-files-associations ["*.php" "*.phtml" "*.module" "*.inc"]))


(provide 'lsp-config)
