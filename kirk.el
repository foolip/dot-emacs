;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Window-Size-X.html
(toggle-frame-maximized)

(add-hook 'java-mode-hook (lambda ()
			    (setq c-basic-offset 4)))

(global-set-key (kbd "M-g") 'goto-line)

(setenv "PAGER" "/bin/cat")

(global-set-key (kbd "M-s M-l") 'sort-lines)

(add-hook 'c++-mode-hook 'flyspell-prog-mode)
(add-hook 'c-mode-hook 'flyspell-prog-mode)
