(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l"
        lsp-session-file (concat +emacs-cache-dir "lsp-session")
        lsp-server-install-dir (concat +emacs-local-dir "lsp-server"))

  :hook
  (rust-mode . lsp)

  :commands lsp)

  (use-package lsp-ui
    :config
    (setq lsp-ui-peek-enable nil))

(use-package consult-lsp)

(provide 'init-lsp)
