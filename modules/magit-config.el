(require 'use-package)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  )

(provide 'magit-config)

