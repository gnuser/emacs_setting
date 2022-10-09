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

(use-package multiple-cursors
  :ensure t
  :bind ("C-c i" . mc/edit-lines)
  :bind ("C-c a" . mc/mark-all-words-like-this)
  :bind ("M-o" . mc/mark-previous-like-this-word)
  :bind ("M-p" . mc/mark-next-like-this-word)
  )
;; macro
;; 1. C-x ( kmacro-start-macro
;; 2. C-x ) kmacro-end-macro
;; 3. C-x e kmacro-end-and-call-macro
;; 4. C-U 42 C-X E run macro 42 times

(provide 'init-edit)
