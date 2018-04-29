;;; company-irony-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
<<<<<<< HEAD
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "company-irony" "company-irony.el" (23265 35405
;;;;;;  233933 795000))
=======
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "company-irony" "company-irony.el" (23164 26148
;;;;;;  34487 420000))
>>>>>>> e2a8722d4389f2b9ef5ffa873f7087d8f53df54f
;;; Generated autoloads from company-irony.el

(autoload 'company-irony "company-irony" "\


\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'company-irony-setup-begin-commands "company-irony" "\
Include irony trigger commands to `company-begin-commands'.

This allow completion to be automatically triggered after member
accesses (obj.|, obj->|, ...).

This may be useful to company < `0.8.4', newer version of company
include these commands by default.

\(fn)" nil nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; company-irony-autoloads.el ends here
