(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (yank)
  )

(global-set-key (kbd "C-c d") 'duplicate-line)

(use-package ace-jump-mode
  :bind ("C-c j" . ace-jump-mode)
  :bind ("C-c u" . ace-jump-mode-pop-mark))

(use-package expand-region
  :bind ("M-=" . er/expand-region))

;; macro
;; 1. C-x ( kmacro-start-macro
;; 2. C-x ) kmacro-end-macro
;; 3. C-x e kmacro-end-and-call-macro
;; 4. C-U 42 C-X E run macro 42 times

(provide 'init-edit)
