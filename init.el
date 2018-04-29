(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#202020")
 '(background-mode dark)
 '(cursor-color "#cccccc")
 '(custom-enabled-themes (quote (liso)))
 '(custom-safe-themes
   (quote
    ("3448e3f5d01b39ce75962328a5310438e4a19e76e4b691c21c8e04ca318a5f62" "07816e86f29cb5a696bb6e1675b41be0abe2f1f3e6bdf19c3ca33277ec5062b5" default)))
 '(foreground-color "#cccccc")
 '(frame-resize-pixelwise t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
 '
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fantasque Sans Mono" :foundry "PfEd" :slant italic :weight normal :height 120 :width normal)))))



;;;;;;;;;;;
;; Other ;;
;;;;;;;;;;;
(global-set-key (kbd "S-<up>") 'windmove-up)
(global-set-key (kbd "S-<down>") 'windmove-down)
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)
(add-hook 'prog-mode-hook 'linum-mode)
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)
(desktop-save-mode 1)




;;;;;;;;;;;;
;; Backup ;;
;;;;;;;;;;;;
(setq backup-directory-alist
`((".*" . , "~/Documents/emacs/backups")))
(setq auto-save-file-name-transforms
`((".*" , "~/Documents/emacs/backups")))

;; (message "Deleting old backup files...")
;; (let ((week (* 60 60 24 7))
;;       (current (float-time (current-time))))
;;   (dolist (file (directory-files "~/Documents/Emacs/Backups"))
;;     (when (and (backup-file-name-p file)
;;                (> (- current (float-time (nth 5 (file-attributes file))))
;;                week))
;; 	       (message "%s" file)
;; 	       (delete-file file))))




;;;;;;;;;;;;;
;; Company ;;
;;;;;;;;;;;;;
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)
(setq company-auto-complete nil)
(setq company-c-headers-path-system
       (quote
	("/usr/include/c++/7/" "/usr/include/" "/usr/local/include/")))
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(define-key company-active-map [(tab)] 'company-complete)
(define-key company-active-map (kbd "TAB") 'company-complete)





;;;;;;;;;;;
;; Irony ;;
;;;;;;;;;;;
(require 'irony)
(require 'company-irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(setq irony-additional-clang-options (quote ("-std=c++11")))
(setq irony-cdb-compilation-databases
      (quote
       (irony-cdb-json irony-cdb-clang-complete irony-cdb-libclang)))




;;;;;;;;;;;;;;
;; Flycheck ;;
;;;;;;;;;;;;;;
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))



;;;;;;;;;;;;;
;; WebMode ;;
;;;;;;;;;;;;;
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

