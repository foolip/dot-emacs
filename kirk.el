(setq load-path (cons "~/.elisp" load-path))

(require 'find-things-fast)
(global-set-key '[f1] 'ftf-find-file)
(global-set-key '[f2] 'ftf-grepsource)

(require 'google-c-style)
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
