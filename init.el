;; Add Marmalade; MELPA to package list

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
;; (package-refresh-contents)

;; MELPA Packages

(require 'cmake-mode)
(require 'ess)
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
;; (load-theme 'moe-dark t)

;; Set powerline for moe-mode
;; (powerline-moe-theme)

(load-theme 'base16-eighties-dark)

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
 '(custom-safe-themes
   (quote
    ("bf81a86f9cfa079a7bb9841bc6ecf9a2e8999b85e4ae1a4d0138975921315713" "cdfb22711f64d0e665f40b2607879fcf2607764b2b70d672ddaa26d2da13049f" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "f245c9f24b609b00441a6a336bcc556fe38a6b24bfc0ca4aedd4fe23d858ba31" "0b6645497e51d80eda1d337d6cabe31814d6c381e69491931a688836c16137ed" "70b5e506efe625e6a9cf71ddd5dbbf35b960229f32637676647bef873485df09" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
