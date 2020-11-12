;;; Local customzations prior to init sequence

(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")
;;; Local customizations

;; Automatically turn on org mode for all files that have certain extensions
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

;; Set up directories and files
(setq org-directory "~/git/org")
(setq org-default-notes-file "~/git/org/inbox.org")
(setq org-agenda-files (directory-files-recursively "~/git/org" "\\.org$"))

(provide 'init-preload-local)
;;; Init-preload-local.el ends here
