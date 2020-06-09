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
  (dap-tooltip-mode 1)
  (tooltip-mode 1))

(use-package lsp-mode
  :commands lsp
  :ensure t
  :init
  (add-hook 'php-mode-hook #'lsp)
  )

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :init
  (push 'company-lsp company-backends)
  )


(provide 'lsp-config)
