;;; init-elisp.el --- elisp -*- lexical-binding: t -*-
;;; Commentary:
;;

;;; Code:

(require 'init-funcs)

(use-package elisp-mode
  :ensure nil
  :bind (:map emacs-lisp-mode-map
              ("C-c C-c" . eval-to-comment)
              :map lisp-interaction-mode-map
              ("C-c C-c" . eval-to-comment))
  :config
  (defconst eval-as-comment-prefix ";;=> ")

  ;; Imitate scala-mode
  ;; from https://github.com/dakra/dmacs
  (defun eval-to-comment (&optional arg)
    (interactive "P")
    (let ((start (point)))
      (eval-print-last-sexp arg)
      (save-excursion
        (goto-char start)
        (save-match-data
          (re-search-forward "[[:space:]\n]+" nil t)
          (insert eval-as-comment-prefix))))))

(use-package ielm
  :ensure nil
  :hook (ielm-mode . company-mode))

(use-package paredit
  :ensure t
  :init
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (eval-after-load "paredit" '(define-key paredit-mode-map (kbd "<DEL>") nil))
  (add-hook 'org-mode-hook 'enable-paredit-mode) ;; notice at the moment paredit is just bound to org-mode. Expand it.
  )


(provide 'init-elisp)

;;; init-elisp.el ends here
