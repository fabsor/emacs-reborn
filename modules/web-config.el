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

(use-package phpunit
  :ensure t
  )

;; (use-package flycheck-phpstan
;;   :ensure t
;;   :config
;;   (defun my-php-mode-setup ()
;;     "My PHP-mode hook."
;;     (require 'flycheck-phpstan)
;;     (flycheck-mode t))

;;   (add-hook 'php-mode-hook 'my-php-mode-setup)
;;   )

(use-package add-node-modules-path
  :ensure t
  :config
  ;; automatically run the function when web-mode starts
  (eval-after-load 'web-mode
    '(add-hook 'web-mode-hook 'add-node-modules-path)))


(use-package web-mode
  :ensure t
  :after (add-node-modules-path)
  :config
  (require 'flycheck)
  (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl.php$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.blade.php$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.svelte$" . web-mode))

  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-enable-auto-quoting nil)
    (setq web-mode-jsx-depth-faces nil)
    (setq web-mode-enable-block-face nil)
    (if (equal web-mode-content-type "javascript")
        (web-mode-set-content-type "jsx"))
    (setq web-mode-enable-auto-indentation nil))
  (add-hook 'web-mode-hook  'my-web-mode-hook))

;; (use-package tide
;;   :ensure t
;;   :config
;;   (flycheck-add-next-checker 'tsx-tide 'javascript-eslint)
;;   (defun setup-tide-mode ()
;;     (interactive)
;;     (tide-setup)
;;     (flycheck-mode +1)
;;     (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;     (eldoc-mode +1)
;;     (tide-hl-identifier-mode +1)
;;     ;; company is an optional dependency. You have to
;;     ;; install it separately via package-install
;;     ;; `M-x package-install [ret] company`
;;     (company-mode +1))

;;   (require 'web-mode)
;;   (require 'tide)
;;   (global-set-key (kbd "C-c f") 'tide-fix)
;;   (add-hook 'web-mode-hook
;;             (lambda ()
;;               (when
;;                   (string-equal "tsx" (file-name-extension buffer-file-name))
;;                 (setup-tide-mode)
;;                 )))

;;   (add-hook 'web-mode-hook
;;             (lambda ()
;;               (when (string-equal "js" (file-name-extension buffer-file-name))
;;                 (setup-tide-mode)

;;                 )))

;; aligns annotation to the right hand side
;; (setq company-tooltip-align-annotations t)
;;  )

(use-package typescript-mode
  :ensure t
  :after (add-node-modules-path)
  :config

  ;; (defun setup-tide-mode ()
  ;;   (interactive)
  ;;   (tide-setup)
  ;;   (flycheck-mode +1)
  ;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
  ;;   (eldoc-mode +1)
  ;;   (tide-hl-identifier-mode +1)
  ;;   ;; company is an optional dependency. You have to
  ;;   ;; install it separately via package-install
  ;;   ;; `M-x package-install [ret] company`
  ;;   (company-mode +1))

  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  ;; formats the buffer before saving
  ;;(add-hook 'before-save-hook 'tide-format-before-save)

  ;; (add-hook 'typescript-mode-hook #'setup-tide-mode)
  )

(use-package prettier
  :ensure t
  :config
  (add-hook 'typescript-mode-hook (lambda () (prettier-mode +1)))
  (add-hook 'web-mode-hook
            (lambda ()
              (when
                  (member
                   (file-name-extension buffer-file-name)
                   '("jsx" "tsx" "js" "vue" "ts"))
(setq prettier-web-mode-content-type-parsers
  `((nil . (html))
    ("javascript" . (typescript babel-ts))
    ("jsx" . (typescript babel-ts))
    ("typescript" . (typescript babel-ts))
    ("css" . (css))
    ("json" . (json json5))
    ("markdown" . (markdown))
    ("ruby" . (ruby))
    ("sql" . (postgresql))))

                (display-message-or-buffer "Starting")
                (prettier-mode +1)
                )))

  )


(provide 'web-config)
