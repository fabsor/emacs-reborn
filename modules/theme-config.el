(require 'use-package)

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (when (display-graphic-p)
      (load-theme 'sanityinc-tomorrow-bright t)
  ))
(provide 'theme-config)

