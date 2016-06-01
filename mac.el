;; https://github.com/purcell/exec-path-from-shell
(package-install 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Size-and-Position.html
(when (window-system)
  (add-hook 'window-setup-hook
            (lambda ()
              (set-scroll-bar-mode nil)
              (set-frame-position (selected-frame) 0 0)
              (set-frame-size (selected-frame) 1420 847 t))
            t))

;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html
(add-to-list 'default-frame-alist '(font . "Menlo-13"))
(setq line-spacing 1)
