;;; init-elpa.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)
(require 'cl-lib)

;;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
(setq package-user-dir
      (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                        user-emacs-directory))

;;; Standard package repositories

;;; ustc mirrors
(setq package-archives '(("gnu"   . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("org"   . "http://mirrors.ustc.edu.cn/elpa/org/")))


(setq package-enable-at-startup nil)
(package-initialize)

(require 'package)

;;; Install use-package macro
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; Configure use-package
(eval-and-compile
  (setq use-package-always-ensure t)
  ;; (setq use-package-always-defer t)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally t)
  (setq use-package-verbose t))

(require 'use-package)

(setq package-check-signature nil)
;;(let ((package-check-signature nil))
;;  (use-package gnu-elpa-keyring-update))

(provide 'init-elpa)
