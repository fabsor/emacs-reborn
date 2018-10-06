(require 'use-package)

(use-package dracula-theme
  :ensure t
  :config
  (when (display-graphic-p)
      (load-theme 'dracula t)
  ))
(provide 'theme-config)

