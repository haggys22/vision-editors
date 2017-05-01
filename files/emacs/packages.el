;;; This file is managed by Puppet
;; Simply call eval-buffer on this file and it automatically installs all required packages
;; Thanks to Nicolas Dudebout: http://stackoverflow.com/a/10093312

(setq package-list '(
                     auto-complete
                     dockerfile-mode
                     markdown-mode
                     neotree
                     puppet-mode
                     smart-tabs-mode
                     smex
                     web-mode
                     yaml-mode
                     ))

;; init MELPA archive
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'packages.el)
