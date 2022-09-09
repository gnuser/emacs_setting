;; I use Kotlin mode, not perfect, but works. Just start LSP when Kotlin mode starts.
;; hook keyword replaces (add-to-list 'kotlin-mode-hook 'lsp)
;; You can omit the hook and start lsp manually with M-x lsp if you want.
(use-package kotlin-mode
  :hook
  (kotlin-mode . lsp))


(provide 'init-kotlin)
