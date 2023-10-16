;;; init-utils.el --- Elisp helper functions and commands -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(define-obsolete-function-alias 'after-load 'with-eval-after-load "")

;; Handier way to add modes to auto-mode-alist
(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

;; Like diminish, but for major modes
(defun sanityinc/set-major-mode-name (name)
  "Override the major mode NAME in this buffer."
  (setq-local mode-name name))

(defun sanityinc/major-mode-lighter (mode name)
  (add-hook (derived-mode-hook-name mode)
            (apply-partially 'sanityinc/set-major-mode-name name)))

;; String utilities missing from core emacs

(defun sanityinc/string-all-matches (regex str &optional group)
  "Find all matches for `REGEX' within `STR', returning the full match string or group `GROUP'."
  (let ((result nil)
        (pos 0)
        (group (or group 0)))
    (while (string-match regex str pos)
      (push (match-string group str) result)
      (setq pos (match-end group)))
    result))

;; Delete the current file

(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (unless (buffer-file-name)
    (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))


;; Rename the current file

(if (fboundp 'rename-visited-file)
    (defalias 'rename-this-file-and-buffer 'rename-visited-file)
  (defun rename-this-file-and-buffer (new-name)
    "Renames both current buffer and file it's visiting to NEW-NAME."
    (interactive "sNew name: ")
    (let ((name (buffer-name))
          (filename (buffer-file-name)))
      (unless filename
        (error "Buffer '%s' is not visiting a file!" name))
      (progn
        (when (file-exists-p filename)
          (rename-file filename new-name 1))
        (set-visited-file-name new-name)
        (rename-buffer new-name)))))

;; Browse current HTML file

(defun browse-current-file ()
  "Open the current file as a URL using `browse-url'."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if (and (fboundp 'tramp-tramp-file-p)
             (tramp-tramp-file-p file-name))
        (error "Cannot open tramp file")
      (browse-url (concat "file://" file-name)))))

;; Recentf setting
(setq recentf-save-file (expand-file-name "recentf" user-emacs-directory)
      recentf-max-menu-items 25
      recentf-max-saved-items 25)

;; Enable recentf-mode

(recentf-mode t)

;;; Clipboard

(setq select-enable-clipboard t)

;;; Backup

(setq backup-directory (expand-file-name "backup" user-emacs-directory))

(unless (file-exists-p backup-directory)
  (make-directory backup-directory t))

(setq create-lockfiles nil
      make-backupfiles nil
      backup-by-copying t
      backup-directory-alist (list (cons ".*" backup-directory))
      delete-old-versions t
      kept-new-versions 3
      kept-old-versions 1
      version-control t

      auto-save-default t
      auto-save-include-big-deletions t
      auto-save-list-file-prefix (expand-file-name "autosave/" user-emacs-directory)
      tramp-auto-save-directory  (expand-file-name "tramp-autosave/" user-emacs-directory)
      auto-save-file-name-transforms (list (list "\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'"
						 ;; Prefix tramp autosaves to prevent conflicts with local ones
                                                 (concat auto-save-list-file-prefix "tramp-\\2") t)
                                           (list ".*" auto-save-list-file-prefix t)))


(setq-default indent-tabs-mode nil
	      default-tab-width 4)

(defalias 'yes-or-no-p 'y-or-n-p)

(defun open-init-file()
  "Open init.el"
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory)))

(provide 'init-utils)
;;; init-utils.el ends here
