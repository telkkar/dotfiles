;;;; Org mode configuration
;; Enable org mode
(require 'org)

(setq org-directory "~/org")

(setq org-log-done t)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))


;; Agenda
(setq org-agenda-files (list "~/org/repeat/"
			     "~/org/tasks.org"
			     "~/org/appointments/"))


;; Capture
(setq org-default-notes-file (concat org-directory "/refile.org"))
