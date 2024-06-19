(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/copilot/")

(setq package-list
  '(
    use-package
    flycheck
    treemacs
    lsp-mode
    lsp-sourcekit
    lsp-treemacs
    lsp-ui
    company
    which-key
    timu-macos-theme
    swift-mode
    markdown-mode
    all-the-icons
    treemacs-all-the-icons
    aggressive-indent
    centaur-tabs
    smooth-scrolling
    editorconfig
    kanagawa-theme
    web-mode
    wakatime-mode
    hl-todo
    graphql-mode
    lsp-tailwindcss
    fish-mode
  )
)

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
