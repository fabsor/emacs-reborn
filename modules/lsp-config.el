(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-php
  :ensure t
  :demand
  :hook (
         (php-mode . lsp-mode)
         (php-mode . lsp-php-enable)
         )
  :config
  (setq lsp-php-show-file-parse-notifications t)
  )

(provide 'lsp-config)
