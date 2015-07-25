;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Window-Size-X.html
(toggle-frame-maximized)

(add-hook 'java-mode-hook (lambda ()
			    (setq c-basic-offset 4)))

(global-set-key (kbd "M-g") 'goto-line)

(setenv "PAGER" "/bin/cat")

;; https://github.com/ShingoFukuyama/helm-swoop
(package-install 'helm-swoop)
(global-set-key (kbd "C-M-f") 'helm-swoop)

(global-set-key (kbd "C-M-o") 'helm-projectile-find-file)

(global-set-key (kbd "C-M-g") 'projectile-grep)
(global-set-key (kbd "C-M-p") 'previous-error)
(global-set-key (kbd "C-M-n") 'next-error)

(global-set-key '[f5] 'compile-or-recompile)

(global-set-key (kbd "M-s M-l") 'sort-lines)

(add-hook 'c++-mode-hook 'flyspell-prog-mode)
(add-hook 'c-mode-hook 'flyspell-prog-mode)
