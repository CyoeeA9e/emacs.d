(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l"
        lsp-session-file (expand-file-name "lsp-session" user-emacs-directory)
        lsp-server-install-dir (expand-file-name "lsp-server" user-emacs-directory))

  :hook
  (rust-mode . lsp)

  :commands lsp)

  (use-package lsp-ui
    :config
    (setq lsp-ui-peek-enable nil))

(use-package consult-lsp)

(provide 'init-lsp)
