;;; init-local.el --- Load the full configuration ---
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; example configuration for mu4e
(add-to-list 'load-path "/Users/alnlso/git/mu/mu4e")

(require 'mu4e)

(setq mu4e-maildir (expand-file-name "~/Maildir"))

;; use mu4e for e-mail in emacs
(setq mail-user-agent 'mu4e-user-agent)

;; More goes here

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; use 'fancy' non-ascii characters in various places in mu4e
(setq mu4e-use-fancy-chars t)

;; save attachment to my desktop (this can also be a function)
(setq mu4e-attachment-dir "~/Downloads/attachments")

;; attempt to show images when viewing messages
(setq mu4e-view-show-images t)

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; something about ourselves
(setq
 user-mail-address "alnlso@amazon.com"
 user-full-name  "Alex Nelson"
 mu4e-compose-signature
 (concat
  "Regards,\n"
  "Alex Nelson\n"))

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; convert html emails properly
;; Possible options:
;;   - html2text -utf8 -width 72
;;   - textutil -stdin -format html -convert txt -stdout
;;   - html2markdown | grep -v '&nbsp_place_holder;' (Requires html2text pypi)
;;   - w3m -dump -cols 80 -T text/html
;;   - view in browser (provided below)
(setq mu4e-html2text-command "textutil -stdin -format html -convert txt -stdout")

;; spell check
(add-hook 'mu4e-compose-mode-hook
          (defun my-do-compose-stuff ()
            "My settings for message composition."
            (set-fill-column 72)
            (flyspell-mode)))

;; add option to view html message in a browser
;; `aV` in view to activate
(add-to-list 'mu4e-view-actions
             '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; fetch mail every 10 mins
(setq mu4e-update-interval 600)

;; configuration for sending mail
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 585)

;; Conversation mode settings
;;(with-eval-after-load 'mu4e (require 'mu4e-conversation))

;;(global-mu4e-conversation-mode)

;;(require 'org-msg)
;; (setq org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \\n:t"
;;       org-msg-startup "hidestars indent inlineimages"
;;       org-msg-greeting-fmt "\nHi *%s*,\n\n"
;;       org-msg-greeting-name-limit 3
;;       org-msg-text-plain-alternative t
;;       org-msg-signature "

;;  Regards,

;;  #+begin_signature
;;  -- *Alex Nelson* \\\\
;;  /One Emacs to rule them all/
;;  #+end_signature")
;; (org-msg-mode)

(use-package excorporate)

(setq-default
 ;; configure email address and office 365 exchange server adddress for exchange web services
 excorporate-configuration
 (quote
  ("alnlso@amazon.com" . "https://ballard.amazon.com/EWS/Exchange.asmx"))
 ;; integrate emacs diary entries into org agenda
 org-agenda-include-diary t
 )

(provide 'init-local)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-local.el ends here
