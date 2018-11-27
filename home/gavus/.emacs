;;; package --- Summary:

;;; Commentary:

;;; Code:
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (eval-after-load 'evil-maps '(define-key evil-normal-state-map (kbd "M-.") nil))
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config (evil-collection-init))

(use-package magit
  :ensure t
  :config (global-set-key (kbd "C-c g") 'magit-status))

(use-package evil-magit
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

(use-package yasnippet
  :ensure t
  :config (yas-global-mode))

(use-package yasnippet-snippets
  :ensure t)

(use-package smartparens
  :ensure t
  :config (smartparens-global-mode))

(use-package company
  :ensure t
  :config (global-company-mode))

(use-package ggtags
  :ensure t
  :config
  (add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1)))))

(use-package ivy
  :ensure t
  :config (ivy-mode))

(use-package markdown-mode
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))


;; Various settings
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode t)
(setq inhibit-startup-screen t)
(load-theme 'tango-dark)
;;; End

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode evil-magit smartparens ivy company magit evil-collection evil use-package)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide '.emacs)
;;; .emacs ends here
