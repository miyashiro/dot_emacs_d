;;cask
(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize "~/.emacs.d")

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/init-loader")

(setq js-indent-level 2)
