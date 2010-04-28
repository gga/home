(setq ga-plt-font-size 80)

;; Emacs on Windows doesn't seem to set these correctly by default, so I set them
;; directly here.
(setq user-full-name "Giles Alexander")
(setenv "PATH" (concat "e:\\dev\\spike-client-main\\spike\\bin;" (getenv "PATH")))

;; Printing config
(setq printer-name "//dc-3mont/hp2015-3mont-np-ps")
(setq ps-printer-name printer-name)

;; Shell configuration, also used for running compilations
(setq shell-file-name "c:/cygwin/bin/bash.exe")

;; Find config, for running rgrep
(setq grep-find-template "cygfind . <X> -type f <F> -exec grep <C> -nH -e <R> {} NUL \";\"")
