(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(compilation-scroll-output (quote first-error))
 '(compile-command "cd ~/chromium/src/out/Debug; crbuild")
 '(ffap-machine-p-known (quote reject))
 '(fill-column 80)
 '(global-auto-revert-mode t)
 '(global-visual-line-mode nil)
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(make-backup-files nil)
 '(projectile-use-git-grep t)
 '(scroll-bar-mode (quote right))
 '(select-enable-clipboard t)
 '(sentence-end-double-space nil)
 '(sgml-basic-offset 1)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(use-file-dialog nil)
 '(visual-line-fringe-indicators (quote (nil right-curly-arrow)))
 '(which-function-mode t))

;; http://emacswiki.org/emacs/ELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Compilation.html
(defun compile-or-recompile ()
  (interactive)
  (if (fboundp 'recompile) (recompile) (compile)))
(global-set-key (kbd "s-r") 'compile-or-recompile)

;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; https://github.com/foolip/color-theme-sanityinc-tomorrow (base16 branch)
(let ((theme-path (concat user-emacs-directory "color-theme-sanityinc-tomorrow")))
  (add-to-list 'load-path theme-path)
  (add-to-list 'custom-theme-load-path theme-path)
  (load-theme 'sanityinc-tomorrow-night t))

;; http://tuhdo.github.io/helm-intro.html
(package-install 'helm)
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
(setq helm-projectile-fuzzy-match nil)
(helm-mode 1)

;; https://github.com/ShingoFukuyama/helm-swoop
(package-install 'helm-swoop)
(global-set-key (kbd "s-f") 'helm-swoop)

;; http://tuhdo.github.io/helm-projectile.html
(package-install 'projectile)
(package-install 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-enable-caching t)

(global-set-key (kbd "s-x") 'clipboard-kill-region)
(global-set-key (kbd "s-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "s-v") 'clipboard-yank)

(global-set-key (kbd "C-c o") 'ff-get-other-file)
(global-set-key (kbd "s-o") 'helm-projectile-find-file)
(global-set-key (kbd "s-O") 'helm-projectile-find-file-in-known-projects)
(global-set-key (kbd "s-g") 'projectile-grep)
(global-set-key (kbd "s-G") 'vc-git-grep)
(global-set-key (kbd "s-p") 'previous-error)
(global-set-key (kbd "s-n") 'next-error)
(global-unset-key (kbd "s-q"))

;; https://code.google.com/p/chromium/wiki/Emacs
(package-install 'google-c-style)
(c-add-style "WebKit" '("Google"
                        (c-basic-offset . 4)
                        (c-offsets-alist . ((innamespace . 0)
                                            (access-label . -)
                                            (case-label . 0)
                                            (member-init-intro . +)
                                            (topmost-intro . 0)
                                            (arglist-cont-nonempty . +)))))
(add-hook 'c-mode-common-hook
          (lambda ()
            (google-set-c-style)
            (when (and buffer-file-name
                       (string-match "/WebKit/" buffer-file-name))
              (c-set-style "WebKit"))))

;; http://www.emacswiki.org/emacs/DeletingWhitespace#toc3
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; http://web-mode.org/
(package-install 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-markup-indent-offset 1)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-style-padding 0)
(setq web-mode-script-padding 0)
(setq web-mode-block-padding 0)

(fset 'yes-or-no-p 'y-or-n-p)

(defun vc-git-annotate-command (file buf &optional rev)
  (let ((name (file-relative-name file)))
    (vc-git-command buf 'async nil "blame" "--date=iso" rev "--" name)))

(if (eq system-type 'darwin)
  (load (concat user-emacs-directory "mac")))
