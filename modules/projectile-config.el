(require 'use-package)

(use-package projectile
  :ensure t
  :bind
  ("C-x p" . projectile-find-file)
  ("C-x a" . projectile-ripgrep)
  )

(use-package ripgrep
  :ensure t
  )

(provide 'projectile-config)

