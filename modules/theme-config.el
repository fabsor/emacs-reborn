(require 'use-package)

(use-package zenburn-theme
  :ensure t)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-vibrant t))

(defun light ()
  (interactive)
  (load-theme 'doom-opera-light t))

(defun dark ()
  (interactive)
  (load-theme 'doom-vibrant t))

(provide 'theme-config)
