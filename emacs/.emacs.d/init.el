;; -*- mode: elisp -*-

;; User Details
(setq user-full-name "William Michael Holbrook II")
(setq user-mail-address "wmh@fastmail.com")

;; Packages
(package-initialize)
(add-to-list 'package-archives
        '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Disable UI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

(setq inhibit-startup-screen 1)
(setq initial-scratch-message nil)

;; Enable UI elements
(global-linum-mode 1)
(global-hl-line-mode 1)

(setq column-number-mode 1)
(setq visible-bell 1)

;; UX changes
(electric-pair-mode 1)

;; Disable backup and autosave
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Display empty lines
;(global-whitespace-mode)

;; Single letter yes no prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; Enable SBCL
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))


;; Theme
(load-theme 'dracula t)

;; Load other modules/packages settings
(add-to-list 'load-path "~/.emacs.d/modules")
(load-library "org-init")
(load-library "notmuch-init")
(load-library "ivy-init")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (counsel swiper ivy shrink-path dracula-theme all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
