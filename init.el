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
(setq-default tab-width 2)            ;; but maintain correct appearance

;; Newline at end of file
(setq require-final-newline t)

;; delete the selection with a keypress
(delete-selection-mode t)

(setq create-lockfiles nil)
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

;; Strip whitespace on save.
(add-hook 'after-save-hook #'delete-trailing-whitespace)

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

(load "~/.emacs.d/local")
(server-start)
;; No toolbar
(tool-bar-mode -1)
;; No scrollbar
(scroll-bar-mode -1)
;; No menu bar
(menu-bar-mode -1)

;; Global keybidnings
(global-set-key (kbd "C-x C-r") 'replace-string)
(global-set-key (kbd "C-c C-r") 'revert-buffer)

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

(defun risky-local-variable-p (sym &optional _ignored) nil)
