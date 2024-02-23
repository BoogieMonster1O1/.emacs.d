(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

; list the packages you want
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
  )
)


; activate all the packages
; (package-initialize)

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
