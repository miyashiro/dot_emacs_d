((anzu status "installed" recipe
       (:name anzu :after nil :website "https://github.com/syohex/emacs-anzu" :description "A minor mode which displays current match and total matches." :type "github" :branch "master" :pkgname "syohex/emacs-anzu"))
 (auto-complete status "installed" recipe
		(:name auto-complete :after nil :features
		       (auto-complete-config)
		       :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)
		       :post-init
		       (progn
			 (add-to-list 'ac-dictionary-directories
				      (expand-file-name "dict" default-directory))
			 (ac-config-default))))
 (cl-lib status "installed" recipe
	 (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:features el-get :post-init
		(when
		    (memq 'el-get
			  (bound-and-true-p package-activated-list))
		  (message "Deleting melpa bootstrap el-get")
		  (unless package--initialized
		    (package-initialize t))
		  (when
		      (package-installed-p 'el-get)
		    (let
			((feats
			  (delete-dups
			   (el-get-package-features
			    (el-get-elpa-package-directory 'el-get)))))
		      (el-get-elpa-delete-package 'el-get)
		      (dolist
			  (feat feats)
			(unload-feature feat t))))
		  (require 'el-get))))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (expand-region status "installed" recipe
		(:name expand-region :after nil :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme"))
 (f status "installed" recipe
    (:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
	   (s dash)
	   :type github :pkgname "rejeep/f.el"))
 (flycheck status "installed" recipe
	   (:name flycheck :after nil :type github :pkgname "flycheck/flycheck" :description "On-the-fly syntax checking extension" :build
		  '(("makeinfo" "-o" "doc/flycheck.info" "doc/flycheck.texi"))
		  :info "./doc" :depends
		  (dash pkg-info let-alist cl-lib)))
 (flycheck-pos-tip status "installed" recipe
		   (:name flycheck-pos-tip :after nil :type github :pkgname "flycheck/flycheck-pos-tip" :description "Flycheck errors display in tooltip" :depends
			  (pos-tip flycheck)
			  :post-init
			  (setq-default flycheck-display-errors-function 'flycheck-pos-tip-error-messages)))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (helm status "installed" recipe
       (:name helm :after nil :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :autoloads "helm-autoloads" :build
	      (("make"))
	      :build/darwin
	      `(("make" ,(format "EMACS_COMMAND=%s" el-get-emacs)))
	      :build/windows-nt
	      (let
		  ((generated-autoload-file
		    (expand-file-name "helm-autoloads.el"))
		   \
		   (backup-inhibited t))
	      (update-directory-autoloads default-directory)
	      nil)))
(hlinum status "installed" recipe
(:name hlinum :after nil :features
(hlinum)
:description "Extension for linum.el to highlight current line number" :type http :url "http://hlinum-mode.googlecode.com/hg/hlinum.el" :depends linum-ex))
(inf-ruby status "installed" recipe
(:name inf-ruby :description "Inferior Ruby Mode - ruby process in a buffer." :type github :pkgname "nonsequitur/inf-ruby"))
(inflections status "installed" recipe
(:name inflections :description "Convert english words between singular and plural" :type elpa))
(js2-mode status "installed" recipe
(:name js2-mode :after nil :website "https://github.com/mooz/js2-mode#readme" :description "An improved JavaScript editing mode" :type github :pkgname "mooz/js2-mode" :prepare
(autoload 'js2-mode "js2-mode" nil t)))
(let-alist status "installed" recipe
(:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type http :url "http://git.savannah.gnu.org/cgit/emacs.git/plain/lisp/emacs-lisp/let-alist.el"))
(linum-ex status "installed" recipe
(:name linum-ex :description "Display line numbers to the left of buffers" :type emacswiki :features linum-ex))
(magit status "installed" recipe
(:name magit :after nil :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :branch "master" :minimum-emacs-version "24.4" :depends
(dash)
:info "Documentation" :load-path "lisp/" :compile "lisp/" :build
`(("make" ,(format "EMACSBIN=%s" el-get-emacs)
"docs"))
:build/berkeley-unix
`(("gmake" ,(format "EMACSBIN=%s" el-get-emacs)
"docs"))
:build/windows-nt
(progn nil)))
(multiple-cursors status "installed" recipe
(:name multiple-cursors :after nil :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el"))
(package status "installed" recipe
(:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
(progn
(let
((old-package-user-dir
(expand-file-name
(convert-standard-filename
(concat
(file-name-as-directory default-directory)
"elpa")))))
(when
(file-directory-p old-package-user-dir)
(add-to-list 'package-directory-list old-package-user-dir)))
(setq package-archives
(bound-and-true-p package-archives))
(mapc
(lambda
(pa)
(add-to-list 'package-archives pa 'append))
'(("ELPA" . "http://tromey.com/elpa/")
("melpa" . "http://melpa.org/packages/")
("gnu" . "http://elpa.gnu.org/packages/")
("marmalade" . "http://marmalade-repo.org/packages/")
("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
(pkg-info status "installed" recipe
(:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
(dash epl)))
(popup status "installed" recipe
(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :depends cl-lib :pkgname "auto-complete/popup-el"))
(pos-tip status "installed" recipe
(:name pos-tip :description "Show tooltip at point" :type emacswiki))
(powerline status "installed" recipe
(:name powerline :after nil :features
(powerline)
:website "https://github.com/milkypostman/powerline" :depends
(cl-lib)
:description "Powerline for Emacs" :type github :pkgname "milkypostman/powerline" :load-path "."))
(projectile status "installed" recipe
(:name projectile :description "Project navigation and management library for Emacs." :type github :pkgname "bbatsov/projectile" :depends
(dash s f pkg-info)))
(projectile-rails status "installed" recipe
(:name projectile-rails :after nil :type github :pkgname "asok/projectile-rails" :description "Minor mode for Rails projects based on projectile-mode" :depends
(projectile inflections inf-ruby f rake)))
(rainbow-delimiters status "installed" recipe
(:name rainbow-delimiters :after nil :website "https://github.com/Fanael/rainbow-delimiters#readme" :description "Color nested parentheses, brackets, and braces according to their depth." :type github :pkgname "Fanael/rainbow-delimiters"))
(rake status "installed" recipe
(:name rake :description "Run rake commands" :type github :pkgname "asok/rake" :depends
(f dash cl-lib)))
(robe-mode status "installed" recipe
(:name robe-mode :after nil :type github :description "Code navigation, documentation lookup and completion for Ruby" :pkgname "dgutov/robe" :website "https://github.com/dgutov/robe" :depends
(inf-ruby)
:post-init
(add-hook 'ruby-mode-hook 'robe-mode)))
(s status "installed" recipe
(:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
(smartparens status "installed" recipe
(:name smartparens :after nil :description "Autoinsert pairs of defined brackets and wrap regions" :type github :pkgname "Fuco1/smartparens" :depends dash))
(smooth-scroll status "installed" recipe
(:name smooth-scroll :after nil :features
(smooth-scroll)
:description "Minor mode for smooth scrolling." :type emacswiki))
(undo-tree status "installed" recipe
(:name undo-tree :after nil :description "Treat undo history as a tree" :website "http://www.dr-qubit.org/emacs.php" :type git :url "http://www.dr-qubit.org/git/undo-tree.git/"))
(undohist status "installed" recipe
(:name undohist :after nil :type github :pkgname "m2ym/undohist-el" :description "Record and recover undo history" :website "http://d.hatena.ne.jp/m2ym/20090707/1246933894"))
(volatile-highlights status "installed" recipe
(:name volatile-highlights :after nil :features
(volatile-highlights)
:description "Minor mode for visual feedback on some operations in Emacs" :type github :pkgname "k-talo/volatile-highlights.el"))
(yaml-mode status "installed" recipe
(:name yaml-mode :after nil :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode")))
