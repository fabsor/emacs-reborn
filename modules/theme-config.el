(require 'use-package)

(use-package material-theme
  :ensure t
  :config
  (when (display-graphic-p)
      (load-theme 'material t)
  ))
(provide 'theme-config)

