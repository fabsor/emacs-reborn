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
