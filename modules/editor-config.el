(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package company
  :ensure t
  :init (global-company-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(provide 'editor-config)
