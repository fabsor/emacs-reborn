(require 'use-package)

(use-package projectile
  :ensure t
  :bind ("C-x p" . projectile-find-file)
  )

(provide 'projectile-config)

