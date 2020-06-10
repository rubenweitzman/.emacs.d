
;; ;;; This fixed garbage collection, makes emacs start up faster ;;;;;;;
;; (setq gc-cons-threshold 402653184
;;       gc-cons-percentage 0.6)

;; (defvar startup/file-name-handler-alist file-name-handler-alist)
;; (setq file-name-handler-alist nil)

;; (defun startup/revert-file-name-handler-alist ()
;;   (setq file-name-handler-alist startup/file-name-handler-alist))

;; (defun startup/reset-gc ()
;;   (setq gc-cons-threshold 16777216
;; 	gc-cons-percentage 0.1))

;; (add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
;; (add-hook 'emacs-startup-hook 'startup/reset-gc)
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; This is all kinds of necessary
(require 'package)
(setq package-enable-at-startup nil)

;;; remove SC if you are not using sunrise commander and org if you like outdated packages
(setq package-archives '(("ELPA"  . "http://tromey.com/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
(when (file-readable-p "~/.emacs.d/loader.org")
 (org-babel-load-file (expand-file-name "~/.emacs.d/loader.org")))

;;; Experimental email stuff.
(when (file-readable-p "~/.email/email.org")
  (org-babel-load-file (expand-file-name "~/.email/email.org")))

(require 'org)
(require 'ob-tangle)

(setq init-dir (file-name-directory (or load-file-name (buffer-file-name))))
;; (org-babel-load-file (expand-file-name "loader.org" init-dir))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit mark-multiple zerodark-theme use-package rainbow-mode rainbow-delimiters projectile pretty-mode pdf-tools org-roam org-bullets hungry-delete htmlize graphviz-dot-mode git-commit flycheck expand-region elpy dashboard))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
