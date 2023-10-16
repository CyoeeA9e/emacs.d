;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
(setq debug-on-error t)

(setq root-emacs-directory user-emacs-directory)

;; (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq custom-file (locate-user-emacs-file "custom.el"))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq user-emacs-directory (expand-file-name "user/" root-emacs-directory))



(if (not (file-exists-p user-emacs-directory))
    (make-directory user-emacs-directory t))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

;; Adjust garbage collection thresholds during startup, and thereafter

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;;; Map Command to Meta in mac
(setq mac-command-modifier 'meta)

;; Bootstrap config

(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

(require 'init-theme)
(require 'init-corfu)
(require 'init-minibuffer)

(require 'init-editor)

(require 'init-flycheck)
(require 'init-lsp)

(require 'init-git)

;;; Load custom file
(when (file-exists-p custom-file)
  (load custom-file))
