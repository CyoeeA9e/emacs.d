(setq enable-recursive-minibuffers t)

(use-package vertico
  :config
  (setq vertico-resize nil
        vertico-count 10
        vertico-cycle t
        completion-in-region-function (lambda (&reset args)
                                        (apply (if vertico-mode
                                                   #'consult-completion-in-region
                                                 #'completion--in-region)
                                               args)))
  (vertico-mode t))

(use-package savehist
  :init
  (savehist-mode))

(use-package consult)

(provide 'init-minibuffer)
