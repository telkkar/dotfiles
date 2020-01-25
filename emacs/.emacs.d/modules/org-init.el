;;;; Org mode configuration
;; Enable org mode
(require 'package)
(require 'org)

(setq org-directory "~/org")

(setq org-refile-targets '((org-agenda-files :maxlevel . 6)))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)

(setq org-log-done t)
(setq org-log-into-drawer t)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c o") (lambda () (interactive) (find-file (concat org-directory "/org.org"))))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
	      (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)


;; Agenda
(setq org-agenda-files (directory-files-recursively org-directory org-agenda-file-regexp))
(setq org-agenda-include-diary t)
(setq org-agenda-window-setup 'current-window)
(setq org-deadline-warning-days 7)
(setq org-agenda-span 'fortnight)
(setq org-agenda-todo-ignore-deadlines nil)
(setq org-agenda-todo-ignore-scheduled nil)

(setq org-agenda-custom-commands
      '(("c" "Daily Check In"
	 ((agenda "" ((org-agenda-span 1)
		      (org-agenda-start-on-weekday nil)
		      (org-agenda-repeating-timestamp-show-all nil)))
	  (tags "REFILE")
	  (todo "WAITING")
					; Show everything else that doesn't have a scheduled or deadline date
	  (todo "" ((org-agenda-skip-function '(org-agenda-skip-if nil '(scheduled deadline)))))))))

;; Capture
(setq org-default-notes-file (concat org-directory "/refile.org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file org-default-notes-file)
	 "* TODO %?\n%U\n" :clock-in t :clock-resume t)
	("m" "Meeting" entry (file org-default-notes-file)
	 "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
	("p" "Phone Call" entry (file org-default-notes-file)
	 "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)))
