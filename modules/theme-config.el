(require 'use-package)

(use-package zenburn-theme
  :ensure t)

(use-package night-owl-theme
  :ensure t
  :config
  (if (display-graphic-p)
    (progn
    ;; if graphic
      (load-theme 'night-owl t))
    ;; else (optional)
    (load-theme 'zenburn t))
  (when (display-graphic-p)

      ))
(defun light ()
  (interactive)
  (load-theme 'zenburn t))

(defun dark ()
  (interactive)
  (load-theme 'night-owl t))

(provide 'theme-config)

