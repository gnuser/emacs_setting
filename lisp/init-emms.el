;; EMMS basic configuration
(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "/Users/chenjing/workspace/github/gnuser/QQFlacMusicDownloader/music") ;; Change to your music folder

(setq emms-lyrics-dir "/Users/chenjing/workspace/github/gnuser/QQFlacMusicDownloader/music")

;; Choose one of these
(setq emms-info-functions '(emms-info-tinytag))  ;; When using Tinytag
;;(setq emms-info-functions '(emms-info-exiftool)) When using Exiftool

;; Load cover images
(setq emms-browser-covers 'emms-browser-cache-thumbnail-async)

;; Keyboard shortcuts
(global-set-key (kbd "<XF86AudioPrev>") 'emms-previous)
(global-set-key (kbd "<XF86AudioNext>") 'emms-next)
(global-set-key (kbd "<XF86AudioPlay>") 'emms-pause)

(setq emms-playlist-buffer-name " *EMMS*")

(add-hook 'emms-player-started-hook 'emms-show)

(setq emms-playlist-sort-prefix "S")

(define-key emms-playlist-mode-map (kbd "S s") 'emms-playlist-sort-by-score)

(global-set-key (kbd "<f3>") 'emms-playlist-mode-go-popup)

(defun emms-playlist-mode-jump ()
  "Jump to the directory of track at point in `emms-playlist-buffer'."
  (interactive)
  (dired
   (file-name-directory
    (emms-track-get (emms-playlist-track-at) 'name))))

(global-set-key (kbd "C-c e t") 'emms-play-directory-tree)
(global-set-key (kbd "C-c e x") 'emms-start)
(global-set-key (kbd "C-c e v") 'emms-stop)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd "C-c e p") 'emms-previous)
(global-set-key (kbd "C-c e o") 'emms-show)
(global-set-key (kbd "C-c e h") 'emms-shuffle)
(global-set-key (kbd "C-c e e") 'emms-play-file)
(global-set-key (kbd "C-c e SPC") 'emms-pause)
(global-set-key (kbd "C-c e f") 'emms-no-next)
(global-set-key (kbd "C-c e a") 'emms-add-directory-tree)

(global-set-key (kbd "C-c e r") 'emms-toggle-repeat-track)
(global-set-key (kbd "C-c e R") 'emms-toggle-repeat-playlist)
(global-set-key (kbd "C-c e m") 'emms-lyrics-toggle-display-on-minibuffer)
(global-set-key (kbd "C-c e M") 'emms-lyrics-toggle-display-on-modeline)

(global-set-key (kbd "C-c e <left>") (lambda () (interactive) (emms-seek -10)))
(global-set-key (kbd "C-c e <right>") (lambda () (interactive) (emms-seek +10)))
(global-set-key (kbd "C-c e <down>") (lambda () (interactive) (emms-seek -60)))
(global-set-key (kbd "C-c e <up>") (lambda () (interactive) (emms-seek +60)))

(global-set-key (kbd "C-c e s u") 'emms-score-up-playing)
(global-set-key (kbd "C-c e s d") 'emms-score-down-playing)
(global-set-key (kbd "C-c e s o") 'emms-score-show-playing)

(provide 'init-emms)

