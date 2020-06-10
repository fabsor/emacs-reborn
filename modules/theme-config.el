(require 'use-package)

(use-package zenburn-theme
  :ensure t)

(use-package one-themes
  :ensure t
  :config
  (if (display-graphic-p)
    (progn
    ;; if graphic
      (load-theme 'one-dark t))
    ;; else (optional)
    (load-theme 'zenburn t))
  (when (display-graphic-p)

      ))
(defun light ()
  (interactive)
  (load-theme 'one-light t))

(defun dark ()
  (interactive)
  (load-theme 'one-dark t))

(provide 'theme-config)

