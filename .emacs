(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(org-agenda-files
   (quote
    ("~/org/personal.org" "~/org/emacs_help.org" "~/org/blogging.org" "~/org/job.org" "~/org/compass.org" ""))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; word wrap
(global-visual-line-mode t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(require 'org)

(require 'neotree)
(setq neo-smart-open t)

(require 'evil)
(evil-mode 1)
;; (global-evil-tabs-mode t)

(global-evil-leader-mode)

(require 'helm-config)

(evil-leader/set-leader "<SPC>") 
(evil-leader/set-key
  "n" 'neotree-toggle
  "b" 'list-buffers
  "w" 'open-eww-browser
  "t" 'elscreen-create)


;redefining the current buffer to tab functionality
(evil-define-command evil-tabs-current-buffer-to-tab ()
  (let ((nwindows (length (window-list)))
	(cb (current-buffer)))
    (when (> nwindows 1)
      (elscreen-create)
      (switch-to-buffer cb))))

;normal mode key mappings
(evil-define-key 'normal evil-tabs-mode-map
  "M" 'elscreen-kill
  "m" 'evil-tabs-current-buffer-to-tab)

(set-face-attribute 'default nil :height 180)


; web browsing configuration
;https://www.gnu.org/software/emacs/manual/html_node/eww/Basics.html#Basics
;https://www.gnu.org/software/emacs/manual/html_node/eww/index.html#SEC_Contents

(defun log-time ()
  (interactive)
  (insert (format-time-string "%A - %m/%d/%Y - %I:%M %p %Z")))

(define-key (current-global-map) (kbd "C-c C-x t") 'log-time)
(put 'narrow-to-region 'disabled nil)

(define-key org-mode-map
  (kbd "C-c a") 'org-agenda)

(define-key org-mode-map
  (kbd "C-S-<right>") 'org-metaright)

(define-key org-mode-map
  (kbd "C-S-<left>") 'org-metaleft)

(put 'downcase-region 'disabled nil)
