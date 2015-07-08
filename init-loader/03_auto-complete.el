;; auto-complete
(require 'auto-complete)
(defun load-auto-complete ()
  (require 'auto-complete-config)
  (ac-config-default)

  (add-to-list 'ac-dictionary-directories "~/.emacs.d/.cask/24.5.1/elpa/auto-complete-20150618.1949/dict")

  (setq ac-use-menu-map t)
  (define-key ac-menu-map "\C-n" 'ac-next)
  (define-key ac-menu-map "\C-p" 'ac-previous)

  (setq ac-auto-show-menu 0.5)
  (setq ac-menu-height 20)

  (robe-mode))
