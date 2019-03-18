;;; Package --- Emacs Summary
;;; Commentary:
;;; Emacs init file

;;; Code:
(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


(dolist (p '(use-package))
  (when (not (package-installed-p p))
    (package-install p)))

(defvar base-dir (file-name-directory load-file-name)
  "The root dir of the Emacs config.")

(defvar base-savefile-dir (file-name-directory load-file-name)
  "The root dir of the Emacs config.")

(defvar modules-dir (expand-file-name "modules" base-dir)
  "Additional modules")

;; Add modules dir to path
(add-to-list 'load-path modules-dir)

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 8)            ;; but maintain correct appearance

;; Newline at end of file
(setq require-final-newline t)

;; delete the selection with a keypress
(delete-selection-mode t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; autosave the undo-tree history
(setq undo-tree-history-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq undo-tree-auto-save-history t)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; disable annoying blink-matching-paren
(setq blink-matching-paren nil)

;; savehist keeps track of some history
(require 'savehist)
(setq savehist-additional-variables
      ;; search entries
      '(search-ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (expand-file-name "savehist" base-savefile-dir))
(savehist-mode +1)

;; save recent files
(require 'recentf)
(setq recentf-save-file (expand-file-name "recentf" base-savefile-dir)
      recentf-max-saved-items 500
      recentf-max-menu-items 15
      ;; disable recentf-cleanup on Emacs start, because it can cause
      ;; problems with remote files
      recentf-auto-cleanup 'never)

;; use shift + arrow keys to switch between visible buffers
(require 'windmove)
(windmove-default-keybindings)

(setq inhibit-startup-screen t)

(require 'ivy-config)
(require 'magit-config)
(require 'web-config)
(require 'projectile-config)
(require 'start-project)
(require 'theme-config)
(require 'editor-config)
(require 'drupal-config)
(require 'lang-config)
(require 'lsp-config)

(server-start)
;; No toolbar
(tool-bar-mode -1)
;; No scrollbar
(scroll-bar-mode -1)
;; No menu bar
(menu-bar-mode -1)

;; Global keybidnings
(global-set-key (kbd "C-x C-r") 'replace-string)


(setq split-height-threshold nil)
(setq split-width-threshold 0)
(setq pop-up-windows nil)

(setq shell-command-switch "-ic")

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq visible-bell  t)
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

(add-to-list 'default-frame-alist '(ns-appearance . dark))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . dark))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "350dc341799fbbb81e59d1e6fff2b2c8772d7000e352a5c070aa4317127eee94" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(package-selected-packages
   (quote
    (ggtags company-anaconda anaconda-mode material-theme snazzy-theme lsp-php lsp-ui lsp-mode slack color-theme-sanityinc-tomorrow ivy-pass yaml-mode web-mode use-package tide ripgrep projectile php-mode markdown-mode magit geben evil editorconfig dockerfile-mode counsel company)))
 '(php-mode-coding-style (quote drupal)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
