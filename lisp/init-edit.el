(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (yank)
  )
(global-set-key (kbd "C-c d") 'duplicate-line)

(use-package autopair
  :config (autopair-global-mode))

(provide 'init-edit)
