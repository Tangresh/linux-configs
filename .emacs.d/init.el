(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'column-marker)
(require 'restore-frame)
;(require 'frame-restore)

(ido-mode t)

(add-hook 'c-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'LaTeX-mode-hook (lambda () (interactive) (column-marker-1 120)))

;;;;;;;;;;;;;;;;
;; BEGIN styling

;; Color theme
;(color-theme-initialize)
;(color-theme-calm-forest)
(load-theme 'wheatgrass)

(show-paren-mode t)
(setq show-paren-style 'mixed)
(setq line-number-mode t)
(setq column-number-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq inhibit-startup-message t)
;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; '(default ((t (:stipple nil :background "#ffffff" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :family "adobe-courier")))))

(global-whitespace-mode t)
;; 'face for more color
(setq whitespace-style '(face tabs spaces trailing lines space-before-tab indentation empty space-after-tab tab-mark newline))
(setq whitespace-line 0)
(set-face-attribute 'whitespace-space nil :background "black" :foreground "orange")
(set-face-attribute 'whitespace-tab nil :background "black" :foreground "orange")

;; END styling ;;
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; BEGIN org-mode

(add-hook 'org-mode-hook
          (lambda ()
            (global-set-key (kbd "M-[ 1 ; 1 C") 'org-metaright) ; This is actually AltGr-arrowright
            (global-set-key (kbd "M-[ 1 ; 1 D") 'org-metaleft) ; This is actually AltGr-arrowleft
            )
          )

(defun todo ()
  (interactive)
  (find-file "/home/tangresh/ownCloud/TODO/main.org")
  )

;; END org-mode
;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;
;; BEGIN MELPA

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; END MELPA
;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; BEGIN Company

;; Enable company globally for all modes
;;(global-company-mode)

;; Reduce the time after which the company auto completion popup opens
(setq company-idle-delay 0.2)

;; Reduce the number of characters before company kicks in
(setq company-minimum-prefix-length 1)

;; END Company
;;;;;;;;;;;;;;;

;;;;;;;;;;;;;
;; BEGIN Rust

;; Load rust-mode when you open `.rs` files
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; Set path to racer binary
(setq racer-cmd "/usr/bin/racer")

;; Set path to rust src directory
(setq racer-rust-src-path "/usr/src/rust/src/")

;; Setting up configurations when you load rust-mode
(add-hook 'rust-mode-hook

          '(lambda ()
             ;; Enable racer
             (racer-mode)

             ;; Hook in racer with eldoc to provide documentation
             (eldoc-mode)

             ;; Use flycheck-rust in rust-mode
             (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

             ;; Enable company
             (company-mode)

             ;; Use company-racer in rust mode
             (set (make-local-variable 'company-backends) '(company-racer))

             ;; Key binding to jump to method definition
             (local-set-key (kbd "M-.") #'racer-find-definition)

             ;; Key binding to auto complete and indent
             (local-set-key (kbd "TAB") #'company-indent-or-complete-common)
             )
          )

;; END Rust
;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Legacy ;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq c-basic-offset '4
      cmake-tab-width 4
      indent-tabs-mode t)
(setq default-tab-width '4)
(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode t)))
;; (global-set-key (kbd "TAB") 'self-insert-command);	;; make the tab key insert EXACTLY ONE a tab character
;; (global-set-key (kbd "TAB") 'tab-to-tab-stop);	;; use real tabs only, no spaces
;(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;; Use text-mode for php files
(setq auto-mode-alist (cons '("\\.php\\'" . text-mode) auto-mode-alist))

(setq c-default-style '((java . "java")
                        (awk-mode . "awk")
                        (other . "k&r"))) ;; set indentation style in cc-mode
(defun my-make-CR-do-indent ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
;; (add-hook 'c-initialization-hook 'my-make-CR-do-indent) ;; make RET indent the new line

;; enable auto completion with cedet
;; (global-ede-mode 1) ;; Enable the Project management system
;; (semantic-load-enable-code-helpers) ;; Enable prototype help and smart completion

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(global-font-lock-mode t nil (font-lock))
 '(haskell-indent-offset 2)
 '(haskell-literate-default (quote tex))
 '(indent-region-mode t)
 '(make-backup-files nil)
 '(matlab-indent-level 4)
 '(mumamo-global-mode t)
 '(nxhtml-global-minor-mode t)
 '(nxhtml-global-validation-header-mode t)
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(scroll-bar-mode (quote right))
 '(tab-always-indent nil)
;; '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(transient-mark-mode t)
 '(undo-limit 200000)
 '(undo-strong-limit 300000))

;;; Matlab-mode setup:
;; Add local lisp folder to load-path
(setq load-path (append load-path (list "~/elisp")))
;; Set up matlab-mode to load on .m files
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
;; Customization:
(setq matlab-indent-function t)     ; if you want function bodies indented
(setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
(defun my-matlab-mode-hook ()
  (setq fill-column 76))        ; where auto-fill should wrap
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
(defun my-matlab-shell-mode-hook ()
  '())
(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)
;; Turn off Matlab desktop
(setq matlab-shell-command-switches '("-nojvm"))

;; AUCTeX options:
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'TeX-language-de-hook
          (lambda ()
            (ispell-change-dictionary "german"))) ; using "\usepackage[german]{babel}" in your latex file will activate this style.
(add-hook 'latex-mode-hook 'turn-on-reftex) ;
