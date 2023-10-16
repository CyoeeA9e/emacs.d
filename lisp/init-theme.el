
(menu-bar-mode -1)
(if window-system
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;;; Display line numbers

(require 'display-line-numbers)
(defcustom display-line-numbers-exempt-modes
  '(vterm-mode eshell-mode shell-mode term-mode ansi-term-mode)
  "Major modes on which to disable line numbers."
  :group 'display-line-numbers
  :type 'list
  :version "green")

;; Relative line numbers
(setq display-line-numbers-type 'relative)

(global-display-line-numbers-mode)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic nil)
  (load-theme 'doom-one-light t))

(provide 'init-theme)
;;; init-theme.el ends here
