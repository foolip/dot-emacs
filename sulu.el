;; http://stackoverflow.com/questions/9663396/how-do-i-make-emacs-recognize-bash-environment-variables-for-compilation
(let ((path (shell-command-to-string "bash -l -c 'echo -n $PATH'")))
  (setenv "PATH" path)
  (setq exec-path
        (append
         (split-string-and-unquote path ":")
         exec-path)))

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Size-and-Position.html
(when (window-system)
  (add-hook 'window-setup-hook
            (lambda ()
              (set-frame-position (selected-frame) 0 0)
              (set-frame-size (selected-frame) 1420 847 t))
            t))

;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html
(add-to-list 'default-frame-alist '(font . "Menlo-13"))
(setq line-spacing 1)

(global-set-key (kbd "s-o") 'helm-projectile-find-file)
(global-set-key (kbd "s-O") 'helm-projectile-find-file-in-known-projects)
(global-set-key (kbd "s-f") 'helm-swoop)
(global-set-key (kbd "s-g") 'helm-git-grep-at-point)

(global-unset-key (kbd "s-q"))
(global-set-key (kbd "s-g") 'vc-git-grep)
(global-set-key (kbd "s-p") 'previous-error)
(global-set-key (kbd "s-n") 'next-error)
(global-set-key (kbd "s-s") 'magit-status)
(global-set-key (kbd "s-r") 'compile-or-recompile)

(require 'tramp)
(add-to-list 'tramp-remote-path "~/bin")
(add-to-list 'tramp-remote-path "~/src/depot_tools")

(add-hook 'c-mode-common-hook 'c-guess)

;; idl-mode is for something completely different from WebIDL
(add-to-list 'auto-mode-alist '("\\.idl\\'" . c-mode))
