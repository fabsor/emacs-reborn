(require 'use-package)

(use-package solarized-theme
  :ensure t
)
(use-package atom-one-dark-theme
  :ensure t
  :config
  (when (display-graphic-p)
      (load-theme 'atom-one-dark t)
      ))
(defun light ()
  (interactive)
  (load-theme 'solarized-light t))

(defun dark ()
  (interactive)
  (load-theme 'atom-one-dark t))

(provide 'theme-config)


