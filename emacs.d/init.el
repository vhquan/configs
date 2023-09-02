;; Define and initialize package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

;; Keyboard-centric user interface
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Theme
;;(use-package spacegray-theme
;; :config (load-theme 'spacegray t))
(use-package poet-theme
  :config (load-theme 'poet t))

(add-hook 'text-mode-hook
	  (lambda()
	    (variable-pitch-mode 1)))

;; Auto completion
(use-package company
  :config
  (setq company-idle-delay 0
	company-minimum-prefix-length 3
	company-selection-wrap-around t))
(global-company-mode)

(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle 0.5
	which-key-idle-dely 50)
  (which-key-setup-minibuffer))

;; Sensible line breaking
(add-hook 'text-mode-hook 'visual-line-mode)
;; Overwrite selected text
(delete-selection-mode t)
;; Scroll to the first and last line of the buffer
(setq scroll-error-top-bottom t)

(setq make-backup-files nil); stop creating ~ files

;; Nice bullets
(use-package org-superstar
  :config
  (setq org-superstar-special-todo-items t)
  (add-hook 'org-mode-hook (lambda ()
			     (org-superstar-mode 1))))

;; Setting the default font
(set-face-attribute 'default nil :family "Helvetica" :height 110)
(set-face-attribute 'fixed-pitch nil :family "Fira Mono" :height 110)
(set-face-attribute 'variable-pitch nil :family "Helvetica" :height 110)

;; Display inline images in all Org files
(setq org-startup-with-inline-images t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(poet-theme cmake-mode which-key use-package spacegray-theme ox-rfc org-superstar nordic-night-theme mixed-pitch company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
