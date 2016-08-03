;; Add Marmalade; MELPA to package list

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(package-refresh-contents)

;; MELPA Packages

(require 'cmake-mode)
(require 'flycheck)
(require 'flycheck-clangcheck)
(require 'helm)
(require 'irony)
(require 'moe-theme)
(require 'multiple-cursors)
(require 'org)
(require 'powerline)
(require 'rainbow-delimiters)
(require 'sml-mode)
(require 'sml-modeline)
(require 'utop)

;; Ur/Web Mode in custom directory
(add-to-list 'load-path "~/.emacs.d/urweb-mode/")
(require 'urweb-mode)

;; Set moe-dark as default theme
(load-theme 'moe-dark t)

;; Set powerline for moe-mode
(powerline-moe-theme)

;; Initialize irony-mode

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Initialize flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Use the opam installed utop
(setq utop-command "opam config exec -- utop -emacs")

;; Initialize flycheck-clangcheck
;(add-to-list 'load-path "/path/to/flycheck-clangcheck") ;; if you installed manually
;(require 'flycheck-clangcheck)

;(defun my-select-clangcheck-for-checker ()
;  "Select clang-check for flycheck's checker."
;  (flycheck-set-checker-executable 'c/c++-clangcheck
;                                   "/path/to/clang-check")
;  (flycheck-select-checker 'c/c++-clangcheck))

;(add-hook 'c-mode-hook #'my-select-clangcheck-for-checker)
;(add-hook 'c++-mode-hook #'my-select-clangcheck-for-checker)

;;; enable static analysis
;(setq flycheck-clangcheck-analyze t)

;; Replace Emacs M-x with Helm M-x
(global-set-key (kbd "M-x") 'helm-M-x)

;; Initialize multiple curors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

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
