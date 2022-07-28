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
   (add-hook 'php-mode-hook #'lsp)
   ;; (add-hook 'web-mode-hook
   ;;          (lambda ()
   ;;            (when
   ;;                (string-equal "vue" (file-name-extension buffer-file-name))
   ;;              (lsp)


   ;;              )))
   :config
   ;(setq lsp-enable-file-watchers t)
   (setq lsp-file-watch-threshold 10000000)
   (setq lsp-intelephense-files-associations ["*.php" "*.phtml" "*.module" "*.inc"])
   ;(setq lsp-ui-sideline-show-diagnostics nil)

   )


(provide 'lsp-config)
