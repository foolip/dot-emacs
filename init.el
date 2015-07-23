(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(compilation-scroll-output (quote first-error))
 '(compile-command "cd ~/src/chromium/src/out/Debug; crbuild")
 '(custom-enabled-themes (quote (tango-dark)))
 '(global-auto-revert-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(ido-mode (quote buffer) nil (ido))
 '(indent-tabs-mode nil)
 '(make-backup-files nil)
 '(mouse-wheel-mode t nil (mwheel))
 '(scroll-bar-mode (quote right))
 '(sentence-end-double-space nil)
 '(sgml-basic-offset 1)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(use-file-dialog nil)
 '(which-function-mode t)
 '(x-select-enable-clipboard t))

(set-face-attribute 'default nil :height 110)

(global-set-key "\M-g" 'goto-line)

(setenv "PAGER" "/bin/cat")

(global-set-key '[f3] 'vc-git-grep)
(global-set-key "\C-\M-g" 'vc-git-grep)
(global-set-key "\C-\M-p" 'previous-error)
(global-set-key "\C-\M-n" 'next-error)
(global-set-key (kbd "\C-c o") 'ff-find-other-file)

(global-set-key '[f5] 'compile)
(global-set-key '[f7] 'recompile)

(global-set-key "\M-s\M-l" 'sort-lines)

(add-hook 'c++-mode-hook 'flyspell-prog-mode)
(add-hook 'c-mode-hook 'flyspell-prog-mode)

(defun vc-git-annotate-command (file buf &optional rev)
  (let ((name (file-relative-name file)))
    (vc-git-command buf 'async nil "blame" "--date=iso" rev "--" name)))

(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'java-mode-hook (lambda ()
			    (setq c-basic-offset 4)))

(let ((hostname (car (split-string system-name "\\."))))
     (load (concat "~/.emacs.d/" hostname ".el")))
