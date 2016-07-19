;; Add Marmalade; MELPA to package list

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; MELPA Packages

(require 'helm)
(require 'moe-theme)
(require 'org)
(require 'powerline)
(require 'rainbow-delimiters)
(require 'sml-mode)
(require 'sml-modeline)

;; Ur/Web Mode in custom directory
(add-to-list 'load-path "~/.emacs.d/urweb-mode/")
(require 'urweb-mode)

;; Set moe-dark as default theme
(load-theme 'moe-dark t)

;; Set powerline for moe-mode
(powerline-moe-theme)

;; Replace Emacs M-x with Helm M-x
(global-set-key (kbd "M-x") 'helm-M-x)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("70b5e506efe625e6a9cf71ddd5dbbf35b960229f32637676647bef873485df09" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
