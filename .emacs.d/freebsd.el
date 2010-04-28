(setq ga-plt-font "schumacher-clean")
(setq ga-plt-font-size 90)
(set-default-font "Consolas-8")

(setq ps-lpr-command "kprinter")

(setq scheme-program-name "/usr/local/plt/bin/mzscheme")

(defun ga-fbsd-configure-new-frame (f)
  (modify-frame-parameters f '((font . "Consolas-8"))))

(add-hook 'after-make-frame-functions 'ga-fbsd-configure-new-frame)
