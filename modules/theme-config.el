(require 'use-package)

(use-package gruvbox-theme
  :ensure t
  :config
  (when (display-graphic-p)
      (load-theme 'gruvbox-dark-hard t)
  ))
(provide 'theme-config)

