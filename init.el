;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(airline-utf-glyph-branch 57504)
 '(airline-utf-glyph-linenumber 57505)
 '(airline-utf-glyph-readonly 57506)
 '(airline-utf-glyph-separator-left 57520)
 '(airline-utf-glyph-separator-right 57522)
 '(airline-utf-glyph-subseparator-left 57521)
 '(airline-utf-glyph-subseparator-right 57523)
 '(company-auto-complete nil)
 '(company-backends
   (quote
    ((company-c-headers company-irony)
     company-irony company-c-headers company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
     (company-dabbrev-code company-gtags company-etags company-keywords)
     company-oddmuse company-dabbrev)))
 '(company-c-headers-path-system
   (quote
    ("/usr/include/c++/7/" "/usr/include/" "/usr/local/include/")))
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 2)
 '(custom-enabled-themes (quote (molokai)))
 '(custom-safe-themes
   (quote
    ("c616e584f7268aa3b63d08045a912b50863a34e7ea83e35fcab8537b75741956" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "" default)))
 '(global-company-mode t)
 '(inhibit-startup-screen t)
 '(irony-additional-clang-options (quote ("-std=c++11")))
 '(irony-cdb-compilation-databases
   (quote
    (irony-cdb-json irony-cdb-clang-complete irony-cdb-libclang)))
 '(jdee-server-dir "~/Apps/JDEE-Server")
 '(org-agenda-custom-commands
   (quote
    (("p" "Custom 15 days view" agenda ""
      ((org-agenda-start-day "-3d")
       (org-agenda-start-on-weekday nil)
       (org-agenda-span
	(quote 18))))
     ("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil))))
 '(org-entities-user nil)
 '(org-latex-default-packages-alist
   (quote
    (("utf8" "inputenc" t
      ("pdflatex"))
     ("T1" "fontenc" t
      ("pdflatex"))
     ("" "graphicx" t)
     ("" "grffile" t)
     ("" "longtable" nil)
     ("" "wrapfig" nil)
     ("" "rotating" nil)
     ("normalem" "ulem" t)
     ("" "amsmath" t)
     ("" "textcomp" t)
     ("" "amssymb" t)
     ("" "capt-of" nil)
     ("" "hyperref" nil))))
 '(org-latex-packages-alist (quote (("utf8" "inputenc" t))))
 '(org-priority-faces
   (quote
    ((65 . "tomato")
     (66 . "yellow2")
     (67 . "SkyBlue1"))))
 '(package-selected-packages
   (quote
    (web-mode flycheck-irony flycheck company-irony irony airline-themes powerline org-bullets org yasnippet-snippets yasnippet company-c-headers company molokai-theme)))
 '(powerline-default-separator (quote contour))
 '(scheme-program-name "racket")
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fantasque Sans Mono" :foundry "PfEd" :slant italic :weight normal :height 98 :width normal))))
 '(company-preview ((t (:background "#A6E22E" :foreground "black"))))
 '(company-preview-common ((t (:inherit company-preview :foreground "#F92672" :weight bold))))
 '(company-preview-search ((t (:inherit company-preview :background "DarkOrchid3"))))
 '(company-template-field ((t (:inherit company-preview))))
 '(company-tooltip ((t (:inherit company-preview))))
 '(company-tooltip-selection ((t (:inherit company-tooltip :background "green yellow" :box (:line-width 2 :color "grey75" :style released-button))))))


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

;;;;;;;;;;;;
;; Backup ;;
;;;;;;;;;;;;
(setq backup-directory-alist
`((".*" . , "~/Documents/Emacs/Backups")))
(setq auto-save-file-name-transforms
`((".*" , "~/Documents/Emacs/Backups")))

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
(setq company-idle-delay 0)
(define-key company-active-map [(tab)] 'company-complete)
(define-key company-active-map (kbd "TAB") 'company-complete)

;; Irony
(require 'irony)
(require 'company-irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;;;;;;;;;;;;;;
;; Flycheck ;;
;;;;;;;;;;;;;;
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;;;;;;;;;;;;;;;
;; yasnippet ;;
;;;;;;;;;;;;;;;
(add-hook 'c++-mode-hook #'yas-minor-mode)
(add-hook 'c-mode-hook #'yas-minor-mode)
(add-hook 'objc-mode-hook #'yas-minor-mode)
(add-hook 'java-mode-hook #'yas-minor-mode)
(add-hook 'web-mode-hook #'yas-minor-mode)
(add-to-list 'load-path
	     "~/.emacs.d/plugins/yasnippet")
(eval-after-load 'yasnippet
  '(progn
     (define-key yas-minor-mode-map (kbd "TAB") nil)
     (define-key yas-minor-mode-map (kbd "<tab>") nil)
     (define-key yas-minor-mode-map [C-tab] 'yas-expand-from-trigger-key)))


;;;;;;;;;;;;;;
;; web-mode ;;
;;;;;;;;;;;;;;
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;;;;;;;;;;;;;;
;; Org-mode ;;
;;;;;;;;;;;;;;
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; set key for agenda
(global-set-key (kbd "C-c o a") 'org-agenda)
;;file to save todo items
(setq org-agenda-files (quote ("~/Documents/emacs/Todo/todo.org")))
;;set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)
;;open agenda in current window
;; (setq org-agenda-window-setup (quote current-window))
;; (org-todo-list)
;; (add-hook 'after-init-hook (lambda () (org-agenda nil "p")))

;;;;;;;;;;;;;;;
;; Powerline ;;
;;;;;;;;;;;;;;;
(require 'airline-themes)
(load-theme 'airline-kolor)

;;;;;;;;;;;;
;; Ispell ;;
;;;;;;;;;;;;
;; (setq ispell-program-name "hunspell")
;; (setq ispell-dictionary "francais-tex") 
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-buffer)

;;;;;;;;;;;;;;;;;;
;; Outline Mode ;;
;;;;;;;;;;;;;;;;;;
;; (defun turn-on-outline-minor-mode ()
;; (outline-minor-mode 1))
;; (add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
;; (add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
;; (setq outline-minor-mode-prefix "\C-c \C-l")

;;;;;;;;;
;; QML ;;
;;;;;;;;;
;; (autoload 'qml-mode "qml-mode" "Editing Qt Declarative." t)
;; (add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))

;;;;;;;;;;;;;;;;;
;; Final Calls ;;
;;;;;;;;;;;;;;;;;
(desktop-read)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
