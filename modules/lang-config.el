(require 'use-package)

(use-package dockerfile-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package company-anaconda
  :config  
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda))
  :ensure t)

(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  :ensure t)

(use-package rjsx-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
  (add-hook 'rjsx-mode-hook #'setup-tide-mode) 
  (flycheck-add-mode 'typescript-tslint 'rjsx-mode) 
  :ensure t)

(provide 'lang-config)
