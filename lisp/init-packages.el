;; (require 'cl)

;; Add Packages
;; (defvar my/packages '(
;; 		              use-package
;;                       quelpa
;; 		              ;; base
;;                       ;; ui
;;                       dracula-theme
;;                       ;; benmark
;;                       benchmark-init
;; 		              ;; --- Navi
;; 		              ;; --- Auto-completion ---
;; 		              company
;; 		              ;; --- Better Editor ---
;; 		              hungry-delete
;; 		              swiper
;; 		              counsel
;; 		              smartparens
;; 		              ;; --- Major Mode ---
;; 		              js2-mode
;; 		              ;; --- Minor Mode ---
;; 		              nodejs-repl
;; 		              exec-path-from-shell
;; 		              ;; --- Themes ---
;; 		              monokai-theme
;; 		              ;; solarized-theme
;; 		              ;; -- Ruby
;; 		              flymake-ruby
;; 		              prettier-js
;; 		              yasnippet
;; 		              flycheck
;; 		              lsp-mode
;; 		              quelpa-use-package
;; 		              ) "Default packages")

;; (setq package-selected-packages my/packages)

;; (defun my/packages-installed-p ()
;;   (loop for pkg in my/packages
;; 	    when (not (package-installed-p pkg)) do (return nil)
;; 	    finally (return t)))

;;(unless (my/packages-installed-p)
;;  (message "%s" "Refreshing package database...")
;;  (package-refresh-contents)
;;  (dolist (pkg my/packages)
;;    (when (not (package-installed-p pkg))
;;      (package-install pkg))))

;;(use-package auto-package-update
;;  :ensure t
;;  :config
;;  (setq auto-package-update-delete-old-versions t
;;auto-package-update-interval 4)
;;  (auto-package-update-maybe))

(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://github.com/quelpa/quelpa/raw/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(provide 'init-packages)
