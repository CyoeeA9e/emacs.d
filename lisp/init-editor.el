(use-package emacs
  :config
  (setq word-wrap t
        truncate-lines t)
  ;; (global-hl-line-mode)
  (electric-pair-mode)
  :hook
  (prog-mode . hs-minor-mode))

(use-package rainbow-delimiters
  :config
  (rainbow-delimiters-mode))

(use-package hl-todo
  :config
  (global-hl-todo-mode t)
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        '(("TODO" warning bold)
          ("FIXME" error bold)
          ("NOTE" success bold)
          ("BUG" error bold))))

(use-package expand-region
  :bind
  ("C-w" . er/expand-region))

(provide 'init-editor)
;;; init-editor.el ends here
