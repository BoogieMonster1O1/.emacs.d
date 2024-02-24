(load "~/.emacs.d/packages")

(use-package lsp-sourcekit
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable "/usr/bin/sourcekit-lsp"))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-l")
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(load "~/.emacs.d/treemacs")
(load-theme 'timu-macos t)

(add-to-list 'default-frame-alist
             '(font . "SF Mono-11"))

(use-package company)
(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-enable t
        lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-show-hover t
        lsp-ui-sideline-show-code-actions t
        lsp-ui-sideline-update-mode 'line))
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(add-hook 'swift-mode-hook #'lsp)

(use-package which-key
    :config
    (which-key-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons treemacs-tab-bar treemacs-persp treemacs-magit treemacs-projectile treemacs-icons-dired lsp-ui lsp-treemacs lsp-sourcekit flycheck company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
