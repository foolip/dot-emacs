;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Window-Size-X.html
(toggle-frame-maximized)

;; https://code.google.com/p/chromium/wiki/Emacs
(package-install 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(c-add-style "WebKit" '("Google"
                        (c-basic-offset . 4)
                        (c-offsets-alist . ((innamespace . 0)
                                            (access-label . -)
                                            (case-label . 0)
                                            (member-init-intro . +)
                                            (topmost-intro . 0)))))

(dir-locals-set-class-variables
 'google-src
 '((c-mode . ((c-file-style . "Google")))
   (c++-mode . ((c-file-style . "Google")))))
(dir-locals-set-class-variables
 'webkit-src
 '((c-mode . ((c-file-style . "WebKit")))
   (c++-mode . ((c-file-style . "WebKit")))
   (idl-mode . ((c-file-style . "WebKit")))))
(dir-locals-set-directory-class "~/src/opera/" 'google-src)
(dir-locals-set-directory-class "~/src/opera/chromium/src/third_party/WebKit/" 'webkit-src)
(dir-locals-set-directory-class "~/src/chromium/src/" 'google-src)
(dir-locals-set-directory-class "~/src/chromium/src/third_party/WebKit/" 'webkit-src)

(add-hook 'java-mode-hook (lambda ()
			    (setq c-basic-offset 4)))

(global-set-key "\M-g" 'goto-line)

(setenv "PAGER" "/bin/cat")

(global-set-key "\C-\M-o" 'helm-projectile-find-file)

(global-set-key '[f3] 'vc-git-grep)
(global-set-key "\C-\M-g" 'vc-git-grep)
(global-set-key "\C-\M-p" 'previous-error)
(global-set-key "\C-\M-n" 'next-error)

(global-set-key '[f5] 'compile-or-recompile)

(global-set-key "\M-s\M-l" 'sort-lines)

(add-hook 'c++-mode-hook 'flyspell-prog-mode)
(add-hook 'c-mode-hook 'flyspell-prog-mode)
