;;MELPA repository
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;;             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
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

(defun rup-split-window ()
  "split the frame to four windows"  
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-vertically)
  (other-window 2)
  (split-window-vertically)
  ;(set-frame-width (selected-frame) 182); adapt size
  ;(set-frame-height (selected-frame) 51); adapt size
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Rechtschreibpruefung Aspell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Rechtschreibpruefung kann unter Emacs in allen Modi verwendet werden.
; Hier wird fuer die Rechtschreibpruefung das Programm ''Aspell'' verwendet welches bei jeder Distribution
; mit dabei sein sollte. (ggf muss es nachinstalliert werden) Benoetigt wird i.d.R. ''aspell'' und ''aspell-de''
; fuer die entsprechende Sprache z.B. ''aspell-en'' usw. Anstelle von Aspell kann auch Ispall verwendet werden 
; welches bei jeder Distribution mit dabei sein sollte. Ispell ist allerdings etwas aelter, so das Aspell empfohlen wird.
   (setq ispell-program-name "aspell"
   flyspell-default-dictionary "de_DE-neu"
   flyspell-persistent-highlight nil
   ispell-local-dictionary "de_DE-neu")

; Ispell wird automatisch fuer den Buffer geladen.
  (autoload 'ispell-buffer "aspell")

; Ispell kann manuell mit der Tasenkombination C-c C-v also STRG-c STRG-v gestartet werden.
  (global-set-key "\C-c\C-v" 'ispell-buffer)

; Ispell wird im ''Text Modus'' waerend dem eigentlichen schreiben verwendet und muss nicht manuell
; gestartet werden.
  (add-hook 'text-mode-hook 'flyspell-mode)

; Aspell kann auch manuell in jedem Mode aufgerufen werden durch die Eingabe von M-x ispell also ALT-x ispell

; M-x flyspell-mode enables Flyspell mode, which highlights all misspelled words.

; P.S. Die Dateien für Aspell befinden sich nach der Installtion im /home/< user >/ Verzeichniss.
; bei DE: aspell.de.prepl, aspell.de.pws oder bei EN: aspell.de.prepl, aspell.en.pws
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Rechtschreibpruefung Aspell ENDE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
