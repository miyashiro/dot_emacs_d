;;; package --- 
;;; Commentary:
;;; Code:
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; theme
;; (load-theme 'wombat t)

;; El-Get
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
        (eval-print-last-sexp)))

;; install packages (El-Get)
(el-get-bundle auto-complete)
(el-get-bundle magit)
(el-get-bundle helm)
(el-get-bundle flycheck)  ; makeできない場合 -> http://blog.daich.org/2015/03/27/el-get-flycheck/
(el-get-bundle flycheck-pos-tip)
(el-get-bundle undo-tree)
(el-get-bundle expand-region)
(el-get-bundle projectile)
(el-get-bundle projectile-rails)
(el-get-bundle smartparens)
(el-get-bundle rainbow-delimiters)
(el-get-bundle multiple-cursors)
(el-get-bundle js2-mode)
(el-get-bundle yaml-mode)
(el-get-bundle anzu)
(el-get-bundle volatile-highlights)
(el-get-bundle smooth-scroll)
(el-get-bundle hlinum)
(el-get-bundle undohist)
(el-get-bundle robe-mode)

;; auto-complete
;; http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part9
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-filename ac-source-words-in-same-mode-buffers))
(setq ac-auto-start nil)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)  ; M-,で補完開始
(define-key ac-mode-map (kbd "ESC <backtab>") 'ac-fuzzy-complete)  ; M-,で補完開始

;; magit
;; http://qiita.com/takc923/items/c7a11ff30caedc4c5ba7
(require 'magit)

;; helm
;; https://github.com/emacs-helm/helm
;; http://rubikitch.com/tag/helm-source-buffers-list/
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; flycheck + flycheck-pos-tip
;; http://qiita.com/senda-akiha/items/cddb02cfdbc0c8c7bc2b
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(custom-set-variables
       '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;; undo-tree
;; http://qiita.com/takc923/items/c3d64b55fc4f3a3b0838
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;; expand-region
;; https://github.com/magnars/expand-region.el
(require 'expand-region)
(global-set-key (kbd "M-.") 'er/expand-region)

;; projectile + projectile-rails
;; http://kotatu.org/blog/2014/02/28/starts-using-projectile-rails/
(require 'projectile)
(projectile-global-mode)
(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; smartparents
;; http://kiririmode.hatenablog.jp/entry/20131231/p1
(require 'smartparens-config)
(smartparens-global-mode t)

;; rainbow-delimiters
;; http://www.emacswiki.org/emacs/RainbowDelimiters#toc2
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; multiple-cursor
;; https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)
(global-set-key (kbd "C-x .") 'mc/mark-all-like-this)

;; js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; yaml-mode
(require 'yaml-mode)

;; anzu
;; http://qiita.com/syohex/items/56cf3b7f7d9943f7a7ba
(global-anzu-mode)
(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000))

;; volatile-highlights
;; https://github.com/k-talo/volatile-highlights.el
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; smooth-scroll
;; http://qiita.com/ShingoFukuyama/items/429199542c38625c5554
(require 'smooth-scroll)
(smooth-scroll-mode t)

;; hlinum
;; https://code.google.com/p/hlinum-mode/
(require 'hlinum)
(hlinum-activate)

;; undohist
(require 'undohist)

;; robe
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

(provide 'init)

;;; init.el ends here
