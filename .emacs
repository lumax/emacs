;;MELPA repository
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line



(add-to-list 'load-path "~/.emacs.d")    ; This may not be appeared if you have already added.

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;semantic-mode on für den ToolTip
;;auto-completion selber mit auto-complete
(semantic-mode)


(global-set-key (kbd "<C-tab>") 'semantic-ia-complete-tip)
(global-set-key (kbd "C-c TAB") 'semantic-analyze-proto-impl-toggle)
;;  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;  (local-set-key "\C-c TAB" 'semantic-ia-complete-tip)
;;  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;;  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))


;; C-h f  : Describe function
;; C-h v  : Describe variable
;; C-h b  : Describe bindings
;; C-h c <key (C-x C-c)>  : describe-key-briefly
;; C-h k <key> : self-insert-command
;; C-x C-h : show all keybinding beginning with C-x

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "/home/sewerin/.emacsbackup"))))
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; eliminate long "yes" or "no" prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; start emacs with own file
;emacs -q -l my-init-file

;; Custom mode configurations
;; 
;; turn off the menu bar
(menu-bar-mode -1)
;; 
;; turn off the tool bar
(tool-bar-mode -1)

(setq show-trailing-whitespace t)


