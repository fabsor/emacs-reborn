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

(provide 'lang-config)
