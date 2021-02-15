(set-language-environment "utf-8")
(load (expand-file-name "~/quicklisp/slime-helper.el"))  ;or wherever you put it

(setq inferior-lisp-program "~/app/ccl/lx86cl64 -K utf-8")

(require 'slime)
(setq slime-net-coding-system 'utf-8-unix)
(slime-setup '(slime-fancy))
(slime-setup '(slime-company))

;(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;;(add-to-list 'load-path "~/.emacs.d/elpa/w3m-20210101.57/")

;;多行输入也是可能的：使用 C-j 
(require 'w3m-load)
(setq common-lisp-hyperspec-root "~/app/ccl/HyperSpec/")

(setq browse-url-browser-function
      '(("~/app/ccl/HyperSpec/" . w3m-browse-url)
        ; 除了查看 HyperSpec 用 w3m，浏览其他页面还是用默认浏览器，这句话不是必须的
        ("." . browse-url-default-browser)))
(defadvice hungry-delete-backward (before sp-delete-pair-advice activate) (save-match-data (sp-delete-pair (ad-get-arg 0))))
 (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(provide 'init-lisp)
