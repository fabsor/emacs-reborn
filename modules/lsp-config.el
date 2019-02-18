(use-package lsp-mode
  :commands lsp
  :ensure t
  :init
  (setq lsp-clients-php-server-command
`("php" ,(expand-file-name "~/.emacs.d/php-language-server/vendor/bin/php-language-server.php"))
        )
  )

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode))

(provide 'lsp-config)
