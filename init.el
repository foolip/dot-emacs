(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(compilation-scroll-output (quote first-error))
 '(compile-command "cd ~/src/chromium/src/out/Debug; crbuild")
 '(fill-column 80)
 '(global-auto-revert-mode t)
 '(global-visual-line-mode nil)
 '(helm-projectile-fuzzy-match nil)
 '(indent-tabs-mode nil)
 '(make-backup-files nil)
 '(scroll-bar-mode (quote right))
 '(sentence-end-double-space nil)
 '(sgml-basic-offset 1)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(use-file-dialog nil)
 '(visible-bell t)
 '(visual-line-fringe-indicators (quote (nil right-curly-arrow)))
 '(which-function-mode t)
 '(x-select-enable-clipboard t))

;; http://emacswiki.org/emacs/ELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
(add-to-list 'load-path "~/src/color-theme-sanityinc-tomorrow/")
(add-to-list 'custom-theme-load-path "~/src/color-theme-sanityinc-tomorrow/")
(load-theme 'sanityinc-tomorrow-night t)

;; http://tuhdo.github.io/helm-intro.html
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(setq helm-split-window-in-side-p t)
(helm-mode 1)

;; http://tuhdo.github.io/helm-projectile.html
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-enable-caching t)
;;(global-set-key (kbd "s-o") 'helm-projectile-find-file)
;;(global-set-key (kbd "s-O") 'helm-projectile-find-file-in-known-projects)
;;(global-set-key (kbd "s-f") 'helm-swoop)
;;(global-set-key (kbd "s-g") 'helm-git-grep-at-point)

;; http://www.emacswiki.org/emacs/DeletingWhitespace#toc3
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(fset 'yes-or-no-p 'y-or-n-p)

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

;; load hostname.el, if it exists
(let ((hostname (car (split-string system-name "\\."))))
     (load (concat "~/.emacs.d/" hostname ".el")))
