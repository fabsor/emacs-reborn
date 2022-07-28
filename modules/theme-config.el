(require 'use-package)

(use-package zenburn-theme
  :ensure t)

(use-package doom-themes
  :ensure t
  :config
  (if (display-graphic-p)
    (progn
    ;; if graphic
      (load-theme 'doom-challenger-deep t))
    ;; else (optional)
    (load-theme 'zenburn t))
  (when (display-graphic-p)

      ))
(defun light ()
  (interactive)
  (load-theme 'doom-opera-light t))

(defun dark ()
  (interactive)
  (if (display-graphic-p)
    (progn
    ;; if graphic
      (load-theme 'doom-challenger-deep t))
    ;; else (optional)
    (load-theme 'zenburn t))
)
(provide 'theme-config)
