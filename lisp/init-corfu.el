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

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-override '((file (style basic partial-completion)))))

(provide 'init-corfu)
