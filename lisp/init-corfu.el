(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)

  :config
  (setq kind-icon-use-icons nil)
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-quit-at-boundary nil)
  (corfu-quit-no-match 'separator)
  (corfu-preselect 'prompt)
  (corfu-preview-current nil)

  :bind
  (:map corfu-map
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("S-TAB" . corfu-previous)
        ([backtab] . corfu-previous))
  :init
  (global-corfu-mode))

(use-package corfu-terminal
  :config
  (unless (display-graphic-p)
    (corfu-terminal-mode t)))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-override '((file (style basic partial-completion)))))

(provide 'init-corfu)
