(require 'use-package)

(use-package dockerfile-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package elpy
  :config
  (setq elpy-rpc-python-command "python3")
  :ensure t)

(use-package rjsx-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
  (add-hook 'rjsx-mode-hook #'setup-tide-mode) 
  (flycheck-add-mode 'typescript-tslint 'rjsx-mode) 
  :ensure t)

(provide 'lang-config)
