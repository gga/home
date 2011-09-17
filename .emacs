;; No startup message!
(setq inhibit-startup-message t)

;; Load some per-platform config settings
(load "~/.emacs.d/platform.el")
(if (eq system-type 'darwin)
    (load "~/.emacs.d/darwin.el"))
(if (eq system-type 'gnu/linux)
    (load "~/.emacs.d/linux.el"))
(if (eq system-type 'windows-nt)
    (load "~/.emacs.d/windows.el"))
(if (eq system-type 'berkeley-unix)
    (load "~/.emacs.d/freebsd.el"))

;; Stupid emacs is stupid
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq make-backup-files nil)

(require 'ido)
(ido-mode t)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(add-to-list 'load-path "~/.emacs.d/scala")
(add-to-list 'load-path "~/.emacs.d/jump")
(add-to-list 'load-path "~/.emacs.d/ruby")
(add-to-list 'load-path "~/.emacs.d/yasnippet-0.2.2")
(add-to-list 'load-path "~/.emacs.d/feature-mode")
(add-to-list 'load-path "~/.emacs.d/clojure-mode")
(add-to-list 'load-path "~/.emacs.d/slime")
(add-to-list 'load-path "~/.emacs.d/midje-mode")
(add-to-list 'load-path "~/.emacs.d/magit")
;; Load Ruby libraries
(load-library "ruby-mode")
(load-library "inf-ruby")
(load-library "rubydb3x")
(load "~/.emacs.d/nxhtml/autostart.el")
;; Load flyspell
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
;; Load js2 mode for improved javascript
(autoload 'js2-mode "js2" nil t)

;; Turn on linum-mode for every visited file
(add-hook 'find-file-hook 'linum-mode)
(setq linum-offset t)

(require 'cl)
(require 'dired)
(require 'uniquify)
(require 'color-theme)
(require 'color-theme-solarized)
(require 'cc-mode)
(require 'scala-mode-auto)
(require 'ruby-mode)
(require 'haml-mode)
(require 'parenface)
(require 'yasnippet)
(require 'todochiku)
(require 'puppet-mode)
(require 'feature-mode)
(require 'linum)
(require 'magit)

;; Clojure and Slime setup
(require 'clojure-mode)
(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))
	  (setq slime-protocol-version 'ignore)))
(require 'midje-mode)
(add-hook 'clojure-mode-hook 'midje-mode)
(require 'slime)
(slime-setup)

(defun save-buffer-if-visiting-file (&optional args)
  "Save the current buffer only if it is visiting a file"
  (interactive)
  (if (and (buffer-file-name) (buffer-modified-p))
      (save-buffer args)))
(add-hook 'auto-save-hook 'save-buffer-if-visiting-file)
;; And run auto-save frequently enough to be interesting
(setq auto-save-interval 1)

(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)

;; Set up my preferred color theme
(color-theme-initialize)
;; (color-theme-charcoal-black)
(color-theme-solarized-dark)

(setq user-mail-address "giles.alexander@thoughtworks.com")

(defun turn-on-flyspell ()
  "Turns on flyspell, guaranteed."
  (interactive)
  (flyspell-mode 1))
(setq ispell-program-name "/usr/local/bin/ispell")

(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'message-mode-hook 'turn-on-flyspell)

(setq tab-width 2)
(setq indent-tabs-mode nil)
(setq visible-bell t)

;; Ack config
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;; Improved searching:
(defun ga/isearch-yank-current-word ()
  "Pull current word from buffer into search string."
  (interactive)
  (save-excursion
    (skip-syntax-backward "w_")
    (isearch-yank-internal
     (lambda ()
       (skip-syntax-forward "w_")
       (point)))))
(define-key isearch-mode-map (kbd "C-x") 'ga/isearch-yank-current-word)

;; Improved killing:
(defun ga/kill-entire-current-line ()
  "Kills the entire current line."
  (interactive)
  (save-excursion
    (move-beginning-of-line nil)
    (kill-line 1)))
(global-set-key "\C-xj" 'ga/kill-entire-current-line)

;; I only use vertical splits to display two windows of code next to each other,
;; typically those two windows will be each wide enough to display most lines, so
;; continue longer lines
(setq truncate-partial-width-windows nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(tab-width 2)
 '(indent-tabs-mode nil)
 '(canlock-password "fc42db0a3ede323f9d0f2ac4768d0f88d055a790")
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(scroll-bar-mode nil)
 '(transient-mark-mode t)
 '(whitespace-check-leading-whitespace nil)
 '(whitespace-check-trailing-whitespace nil)
 '(whitespace-check-buffer-trailing nil)
 '(whitespace-global-mode t)
 '(windmove-wrap-around t)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-global-externs '("emb")))
(winner-mode 1)

;; Adjustments to the font lock colouring. Made manually rather than
;; with custom as it provides more reliable control.
(set-face-attribute 'default
		    t
		    :family ga-plt-font
		    :height ga-plt-font-size)
;; (set-face-attribute 'dired-directory
;; 		    t
;; 		    :foreground "deep sky blue")
;; (set-face-attribute 'dired-ignored
;; 		    t
;; 		    :foreground "grey30")
;; (set-face-attribute 'font-lock-comment-delimiter-face
;; 		    t
;; 		    :foreground "lime green")
;; (set-face-attribute 'font-lock-comment-face
;; 		    t
;; 		    :foreground "lime green")

;; Make the TAB key indent if at the beginning of a line, or perform an expansion
;; everywhere else
(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (dabbrev-expand arg)
    (indent-according-to-mode)))
(defun ga-tab-fix ()
  (local-set-key [tab] 'indent-or-expand))

(defun duplicate-line ()
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
    (kill-line)
    (yank)
    (open-line 1)
    (next-line 1)
    (yank)))

;; Get rid of extraneous and useless UI elements
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Indents the start of a parenthesis to one level less than the rest of the code
(defun ga-c-lineup-open-paren (langelem)
  "Line up an open parenthesis in an *-cont syntactic element indented
one extra step. Works with: arglist-cont."
  (save-excursion
    (beginning-of-line)
    (if (looking-at "\\W*(")
	c-basic-offset
      nil)))

;; Indents anonymous namespaces by the basic offset, but offers no
;; advice for other namespaces
(defun ga-c-lineup-anon-namespace (langelem)
  "Line up all statements in an anonymous namespace by the c-basic-offset, offer no advice on other namespaces. Works with: innamespace."
  (save-excursion
    (goto-char (c-langelem-pos langelem))
    (if (looking-at "\\W*{")
	(previous-line))
    (if (looking-at "^namespace\\W*$")
	c-basic-offset
      nil)))

;; C++ coding standards customisations for the Netpage team
(defun ga-netpage-coding-standard ()
  (c-set-style "stroustrup")
  (setq tab-width 4)
  (setq c-basic-offset tab-width)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'arglist-cont '(ga-c-lineup-open-paren c-lineup-gcc-asm-reg 0))
  (c-set-offset 'arglist-close 0)
  (C-set-offset 'topmost-intro-cont '(ga-c-lineup-open-paren c-lineup-topmost-intro-cont))
  (c-set-offset 'innamespace '(ga-c-lineup-anon-namespace 0))
  ;; Treat *.h files as C++, not C
  (add-to-list 'auto-mode-alist '("\\.[h]\\'" . c++-mode))
  (setq indent-tabs-mode nil))

;; Objective-C coding standards for the Aegean sub-team
(defun ga-aegean-coding-standard ()
  (c-set-style "stroustrup")
  (setq tab-width 2)
  (setq c-basic-offset tab-width)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'arglist-cont '(ga-c-lineup-open-paren c-lineup-gcc-asm-reg 0))
  (c-set-offset 'arglist-close 0)
  ;; Treat *.h files as Objective-C, not C
  (add-to-list 'auto-mode-alist '("\\.[h]\\'" . objc-mode))
  (add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
  (setq indent-tabs-mode nil))

;; Useful functions while working with C++ source
;; At some point re-write this to walk up the directory tree from the current buffer
;; until we find a marker file for a workspace root
(defun ga-source-root ()
  "Returns the source root for the current file. Defined as the first directory above the file that contains a file named .src-root."
  (interactive)
  (defun walk-up (dir)
    (if (<= (length dir) 1)
	""
      (if (file-exists-p (concat dir ".src-root"))
	  dir
	(let ((new-dir (substring dir 0 (- (length dir) 1))))
	  (walk-up (file-name-directory new-dir))))))
  (walk-up (file-name-directory (buffer-file-name))))

(defun ga-visit-include-file (&optional in-other-window)
  "Visits the file #include'd on the current line."
  (interactive "P")
  (save-excursion
    (move-beginning-of-line 1)
    (if (looking-at "#include <\\([a-zA-Z_./]*\\)>")
	(let ((inc-file (concat (ga-source-root) (match-string 1))))
	  (if (not in-other-window)
	      (find-file inc-file)
	    (find-file-other-window inc-file))))))

(defun ga-visit-require-file (&optional in-other-window)
  "Visits the file require'd on the current line."
  (interactive "P")
  (save-excursion
    (move-beginning-of-line 1)
    (if (looking-at "require '\\([a-zA-Z_./]*\\)'")
	(let ((req-file (concat (file-name-directory (buffer-file-name)) "/" (match-string 1) ".rb")))
	  (if (not in-other-window)
	      (find-file req-file)
	    (find-file-other-window req-file))))))

(defun ga-create-define-name (name)
  (let ((f-name (substring name (length (ga-source-root)))))
    (let ((s-name (replace-in-string f-name "/" "__")))
      (replace-in-string s-name "\\." "_"))))

(defun ga-class-from-file-name (file-name)
  (let ((f-name (substring file-name (length (file-name-directory file-name)))))
    (substring f-name 0 (- (length f-name) 2))))

;; C-mode configuration
(defun ga-c-mode-common-hook ()
  (ga-aegean-coding-standard)
  (ga-tab-fix)
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  (define-key c-mode-base-map "\C-c\C-i" 'ga-visit-include-file)
  (define-key c-mode-base-map "\C-c\C-h" 'ff-get-other-file)
  (define-key c-mode-base-map [C-tab] 'yas/expand)
  (c-subword-mode 1)
  (flyspell-prog-mode))
(add-hook 'c-mode-common-hook 'ga-c-mode-common-hook)

;; Mode settings
(line-number-mode 1)
(column-number-mode 1)
;; Give better naming of identically named files
(setq uniquify-buffer-name-style 'reverse) ;; Put the dir name at the end of the buffer name
(setq uniquify-separator "|") ;; Separate file and dir with a |
(setq uniquify-after-kill-buffers-p t) ;; Rename uniquified buffers when one is killed
(setq uniquify-ignore-buffers-re "^\\*") ;; Ignore special buffers

;; Custom key bindings
(global-set-key "\C-x\C-c" 'ignore)
(global-set-key "\C-x\C-q" 'kill-emacs)
(global-set-key "\C-x\C-b" 'bs-show)
(global-set-key [f4] 'next-error)
(global-set-key [f5] 'call-last-kbd-macro)
(global-set-key [f6] 'compile)
(global-set-key [f7] 'recompile)
(global-set-key "\C-x\M-k" 'duplicate-line)
;; Window movement keys: provides quick jumping between many open windows
(global-set-key [(meta left)] 'windmove-left)
(global-set-key [(meta right)] 'windmove-right)
(global-set-key [(meta up)] 'windmove-up)
(global-set-key [(meta down)] 'windmove-down)

(defun remove-string-from-buffer (str)
  "Removes all occurences of the string STR from the current buffer."
  (interactive "MRemove string: ")
  (save-excursion
    (goto-char (point-min))
    (replace-string str "")))

;; Ruby mode configuration
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(defun ga-ruby-mode-hook ()
  (inf-ruby-keys)
  (setq tab-width 2)
  (setq ruby-indent-level tab-width)
  (define-key ruby-mode-map [C-tab] 'yas/expand)
  (define-key ruby-mode-map "\C-c\C-i" 'ga-visit-require-file)
  (flyspell-prog-mode))
(add-hook 'ruby-mode-hook 'ga-ruby-mode-hook)

;; Configure Snippeting engine
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet-0.2.2/snippets/")

;; nXHtml mode configuration
(setq
 nxhtml-global-minor-mode t
 nxhtml-skip-welcome t
 indent-region-mode t
 rng-nxml-auto-validate-flag nil
 nxml-degraded t
 nxml-child-indent 2)
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo))
(add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode))

;; Treat feature files as cucumbers
(defun ga/feature-next-scenario ()
  (interactive)
  (if (looking-at "Scenario")
      (move-end-of-line 1))
  (search-forward "Scenario:" (point-max) "end")
  (beginning-of-line-text))
(defun ga/feature-prev-scenario ()
  (interactive)
  (search-backward "Scenario:" (point-min) "end")
  (beginning-of-line-text))
(defun ga/feature-mode-hook ()
  (define-key feature-mode-map "\M-n" 'ga/feature-next-scenario)
  (define-key feature-mode-map "\M-p" 'ga/feature-prev-scenario))
(add-hook 'feature-mode-hook 'ga/feature-mode-hook)
(add-to-list 'auto-mode-alist '("\.feature\\'" . feature-mode))

;; Puppet mode configuration
(add-to-list 'auto-mode-alist '("\\.pp\\'" . puppet-mode))

;; JS2 mode (for javascript) configuration
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(defun ga-js2-mode-hook ()
  (setq tab-width 2)
  (setq indent-tabs-mode nil))
(add-hook 'js2-mode-hook 'ga-js2-mode-hook)

;; Use markdown mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Run the emacs in-process server to accept remote-edit requests
(server-start)

(put 'upcase-region 'disabled nil)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
