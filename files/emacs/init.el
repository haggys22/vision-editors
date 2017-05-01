;;; This file is managed by Puppet
;; Thou shall not edit this manually,
;; for all your changes will be undone.

;; init MELPA archive
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; disable menubar
(menu-bar-mode -1)

;; disable backup files
(setq backup-inhibited t)

;; enable overwriting globally
(delete-selection-mode t)

;; When opening a file, always follow symlinks
(setq vc-follow-symlinks t)

;; shorten 'yes' and 'no' to 'y' and 'n'
(fset 'yes-or-no-p 'y-or-n-p)

;; set up smart tabs
(smart-tabs-mode 1)

;; auto close brackets (also "" and {})
(setq electric-pair-pairs '(
			    (?\" . ?\")
			    (?\{ . ?\})
			    ))
(electric-pair-mode 1)

;; highlight matching brackets
(show-paren-mode 1)

;; enable line numbers on the side
(global-linum-mode 1)
(global-visual-line-mode 1)

;; highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#504025")

;; treat CamelCaseSubWords as separate words in every programming mode
(add-hook 'prog-mode-hook 'subword-mode)

;; setup ido-mode
(setq ido-everywhere t
	  ido-enable-dot-prefix t
      ido-enable-flex-matching t
      ido-enable-tramp-completion nil)
(ido-mode 1)

;; replace default M-x interface with ido-like interface
(global-set-key (kbd "M-x") 'smex)

;; reload the current buffer from file (without asking)
(defun revert-this-buffer ()
  (interactive)
  (revert-buffer nil t t)
  (message (concat "Reverted buffer " (buffer-name))))

;; switch to previous window
(defun prev-window ()
  (interactive)
  (other-window -1))

;; generic key bindings
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-l") 'comment-or-uncomment-region)
(global-set-key (kbd "<f5>") 'revert-this-buffer)
(global-set-key (kbd "C-c i") 'imenu)
(global-set-key (kbd "M-.") 'other-window)
(global-set-key (kbd "M-,") 'prev-window)
(global-unset-key (kbd "C-z"))

;; associate major modes with file names
(add-to-list 'auto-mode-alist '("\\.md$'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.json$'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.html\$'" . ac-html))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(provide 'init)
