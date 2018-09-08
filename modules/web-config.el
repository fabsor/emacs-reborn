(require 'use-package)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ts$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.module$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.test$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.inc$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.install$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.profile$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.engine$" . web-mode))
  
  (defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-enable-auto-quoting nil)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)

  )

(provide 'web-config)
