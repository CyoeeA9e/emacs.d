(defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(orderless)))

(use-package lsp-mode
  :custom
  (lsp-completion-provider :none)
  
  :init
  (setq lsp-keymap-prefix "C-c l"
        lsp-session-file (expand-file-name "lsp-session" user-emacs-directory)
        lsp-server-install-dir (expand-file-name "lsp-server" user-emacs-directory)

        lsp-inlay-hint-enable t)

  :hook
  (rust-mode . lsp)
  (lsp-completion-mode . my/lsp-mode-setup-completion)

  :commands lsp)

(use-package lsp-ui
  :config
  (setq lsp-ui-peek-enable nil))

(use-package consult-lsp)

(provide 'init-lsp)
