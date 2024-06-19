(load "~/.emacs.d/packages")

(setq server-port 38465)
(setq server-host "127.0.0.1")
(setq server-auth-key "perfume")

(use-package lsp-sourcekit
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable "/usr/bin/sourcekit-lsp"))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-l")
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(require 'copilot)
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

(use-package all-the-icons
  :if (display-graphic-p))

(load "~/.emacs.d/treemacs")
(load-theme 'timu-macos t)

(global-wakatime-mode)

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
(add-hook 'swift-mode-hook #'hl-todo-mode)

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-height 32)
  (setq centaur-tabs-set-bar 'left)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-modified-marker "•")
  (setq centaur-tabs-cycle-scope 'tabs)
  (setq centaur-tabs-set-bar 'under)
  :bind
  ("C-<tab>" . centaur-tabs-forward)
  ("C-<iso-lefttab>" . centaur-tabs-backward))

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1)
  (setq smooth-scroll-margin 2))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package which-key
    :config
    (which-key-mode))

(add-to-list 'auto-mode-alist '("\\.svelte\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(setq web-mode-engines-alist
      '(("svelte" . "\\.svelte\\'")))

(define-derived-mode astro-mode web-mode "astro")
(setq auto-mode-alist
      (append '((".*\\.astro\\'" . astro-mode))
              auto-mode-alist))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration
               '(astro-mode . "astro"))

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("astro-ls" "--stdio"))
                    :activation-fn (lsp-activate-on "astro")
                    :server-id 'astro-ls)))

(defun setup-lsp ()
  (lsp-deferred))

(add-hook 'web-mode-hook #'setup-lsp)
(add-hook 'python-mode-hook #'setup-lsp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("ee0785c299c1d228ed30cf278aab82cf1fa05a2dc122e425044e758203f097d2" "a8354a5bb676d49a45ddf1289a53034cb34fda9193f412f314bdb91c82326ee9" default))
 '(package-selected-packages
   '(go-mode adwaita-dark-theme lsp-tailwindcss powershell graphql-mode hl-todo wakatime-mode web-mode kanagawa-theme aggressive-indent all-the-icons treemacs-tab-bar treemacs-persp treemacs-magit treemacs-projectile treemacs-icons-dired lsp-ui lsp-treemacs lsp-sourcekit flycheck company))
 '(wakatime-cli-path "~/.wakatime/wakatime-cli"))
 '(wakatime-api-key (getenv "WAKATIME_API_KEY"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
