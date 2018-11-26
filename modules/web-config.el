(require 'use-package)

(use-package php-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
  (add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
  (add-to-list 'auto-mode-alist '("\\.test$" . php-mode))
  (add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
  (add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
  (add-to-list 'auto-mode-alist '("\\.profile$" . php-mode))
  (add-to-list 'auto-mode-alist '("\\.engine$" . php-mode))
  )

(use-package geben
  :ensure t
  :bind
  ("C-x t" . geben-add-current-line-to-predefined-breakpoints)
  
  :config
  (setq geben-path-mappings '(("/home/fabsor/projects/leanlab-docker" "/app")))
  (setq geben-dbgp-default-port 9000)
  (setq geben-pause-at-entry-line nil)
  (setq geben-show-redirect-buffers nil)
  )
  
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ts$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl.php$" . web-mode))

  (defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-enable-auto-quoting nil)
  (setq web-mode-jsx-depth-faces nil)
  (setq web-mode-enable-block-face nil)
  )
  (add-hook 'web-mode-hook  'my-web-mode-hook)

  )

(use-package tide
  :ensure t
  :init
  ;; (setq tide-node-executable "/usr/local/bin/node")
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    ;; company is an optional dependency. You have to
    ;; install it separately via package-install
    ;; `M-x package-install [ret] company`
    (company-mode +1))
  (require 'web-mode)
  (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode))))
  (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "ts" (file-name-extension buffer-file-name))
                (setup-tide-mode))))
  
  ;; enable typescript-tslint checker
  (flycheck-add-mode 'typescript-tslint 'web-mode)
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)
)
(provide 'web-config)
