;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "chtc"
      user-mail-address "notnotcha0t1c@protonmail.com")

(setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-font (font-spec :family "Hack Nerd Font Mono" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Hack Nerd Font")
      doom-unicode-font (font-spec :family "Hack Nerd Font Mono" :size 12)
      doom-big-font (font-spec :family "Hack Nerd Font Mono" :size 19))

(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/docs/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Enable global solaire mode
(solaire-global-mode +1)

;; Enable global git gutter mode
(global-git-gutter-mode +1)

(custom-set-variables
 '(git-gutter:update-interval 7))

;; Spaces > tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
