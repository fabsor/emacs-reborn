(require 'use-package)

(use-package dockerfile-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package markdown-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.mdx$" . markdown-mode))
  :ensure t)

(use-package pipenv
  :after importmagic
  :config
  (defun pipenv-hook ()
    (pipenv-mode)
    (pipenv-activate)
    (importmagic-mode)
    (flycheck-add-next-checker 'python-flake8 'python-pyright)
    )
  (add-hook 'python-mode-hook #'pipenv-hook)
  :ensure t)


(use-package python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode)
  :ensure t)

(provide 'lang-config)
