(require 'use-package)

(use-package solarized-theme
  :ensure t
)
(use-package monokai-pro-theme
  :ensure t
  :config
  (when (display-graphic-p)
      (load-theme 'monokai-pro t)
      ))
(defun light ()
  (interactive)
  (load-theme 'solarized-light t))

(defun dark ()
  (interactive)
  (load-theme 'monokai-pro t))

(provide 'theme-config)


