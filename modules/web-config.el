(require 'use-package)

(use-package flycheck-phpstan
  :ensure t
  :config
  (defun php-stan-init ()
    "Phpstan init."
    (require 'flycheck-phpstan)
    (flycheck-mode t))
  (add-hook 'php-mode-hook 'phpstan-init))

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
  (setq geben-dbgp-default-port 9000)
  (setq geben-pause-at-entry-line nil)
  (setq geben-show-redirect-buffers nil)
  )
  
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl.php$" . web-mode))
  ;; (defun web-mode-styled-component-indentation (pos &optional prefix)
  ;; (unless prefix (setq prefix "relayql"))
  ;; (let (beg offset level char)
  ;;   (setq char (char-after))
  ;;   (setq beg (web-mode-part-token-beginning-position pos))
  ;;   (goto-char beg)
  ;;   (cond
  ;;    ((member char '(?\`))
  ;;     (setq offset (current-indentation))
  ;;     )
  ;;    ((member char '(?\) ?\} ?\]))
  ;;     (web-mode-go (web-mode-token-opening-paren-position pos beg prefix))
  ;;     (setq offset (current-indentation))
  ;;     )
  ;;    ((setq level (web-mode-bracket-level pos beg))
  ;;     (setq offset (+ level web-mode-code-indent-offset))
  ;;     )
  ;;    (t
  ;;     (setq offset (+ (current-indentation) web-mode-code-indent-offset))
  ;;     )
  ;;    )
  ;;   offset))
  
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-enable-auto-quoting nil)
    (setq web-mode-jsx-depth-faces nil)
    (setq web-mode-enable-block-face nil))
  (setq web-mode-enable-auto-indentation nil)  
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
    ;;(flycheck-add-next-checker 'typescript-tide '(t . typescript-tslint) 'append)    
    (eldoc-mode +1)
    (global-set-key (kbd "M-RET"), 'tide-fix)
    (tide-hl-identifier-mode +1)
    ;; company is an optional dependency. You have to
    ;; install it separately via package-install
    ;; `M-x package-install [ret] company`
    (company-mode +1))

  (require 'web-mode)
  (add-hook 'web-mode-hook
            (lambda ()
              (when
                  (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode)
                )))

  (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "js" (file-name-extension buffer-file-name))
                (setup-tide-mode)

                )))

  
  ;; enable typescript-tslint checker
  ;; aligns annotation to the right hand side
  (flycheck-add-mode 'typescript-tslint 'web-mode)
  (setq company-tooltip-align-annotations t)
  )

(use-package typescript-mode
  :ensure t
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
  
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)
  
  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)

  (add-hook 'typescript-mode-hook #'setup-tide-mode)  
)

(provide 'web-config)
