;; Define and initialize package repositories
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"    . "http://orgmode.org/elpa/")
			 ("gnu"    . "http://elpa.gnu.org/packages/")
			 ("melpa". "https://melpa.org/packages/")))
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
(add-to-list 'default-frame-alist '(font . "ETBembo-13"))
(add-to-list 'default-frame-alist '(height . 35))
(add-to-list 'default-frame-alist '(width . 90))

;; Theme
;;(use-package spacegray-theme
;; :config (load-theme 'spacegray t))
(use-package poet-theme
  :config (load-theme 'poet t))

(add-hook 'text-mode-hook
	  (lambda()
	    (variable-pitch-mode 1)))

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 78)

;; Enhance UI for Org Mode
(defun enhance-ui-for-orgmode ()
  "Enhance UI for orgmode."
  (org-autolist-mode 1)
  (toggle-truncate-lines)
  (linum-mode -1)
  ;; Beautify Org Checkbox Symbol
  (push '("[ ]" . "☐") prettify-symbols-alist)
  (push '("[X]" . "☑" ) prettify-symbols-alist)
  (push '("[-]" . "❍" ) prettify-symbols-alist)
  (push '("#+BEGIN_SRC" . "⌜" ) prettify-symbols-alist)
  (push '("#+END_SRC" . "⌞" ) prettify-symbols-alist)
  (push '("#+BEGIN_EXAMPLE" . "⌜" ) prettify-symbols-alist)
  (push '("#+END_EXAMPLE" . "⌞" ) prettify-symbols-alist)
  (push '("#+BEGIN_QUOTE" . "⌜" ) prettify-symbols-alist)
  (push '("#+END_QUOTE" . "⌞" ) prettify-symbols-alist)
  (push '("TODO" . "☐" ) prettify-symbols-alist)
  (push '("WORK" . "⚑" ) prettify-symbols-alist)
  (push '("DONE" . "☑" ) prettify-symbols-alist)
  (prettify-symbols-mode)
  (set-face-attribute 'org-level-1 nil :height 1.0 :background nil :weight 'bold)
  (set-face-attribute 'org-level-2 nil :height 1.0 :background nil :weight 'semi-bold)
  (dolist (face '(org-level-3 org-level-4 org-level-5))
    (set-face-attribute face nil :weight 'normal :height 1.0)))

;; Other configs
(global-auto-revert-mode 1)
(global-visual-line-mode 1)
(setq ring-bell-function 'ignore)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Smooth scroll
(pixel-scroll-mode -1)

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
(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "ETBembo" :height 130))))
 '(fixed-pitch ((t (:family "Fira Code" :height 110)))))

;; OrgMode Configs
;; Display inline images in all Org files
(setq org-startup-with-inline-images t)
(setq org-image-actual-width nil)
(add-hook 'org-mode-hook 'enhance-ui-for-orgmode)
(setq org-return-follows-link t)
(setq org-hide-emphasis-markers t)
(setq org-html-validation-link nil)

  (let* ((variable-tuple
          (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
                ((x-list-fonts "EB Garamond") '(:font "EB Garamond"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.2))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.3))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.4))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))

;; Automatically code will be generated here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-superstar which-key company poet-theme use-package cmake-mode)))
