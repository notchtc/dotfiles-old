;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "chtc"
      user-mail-address "notnotcha0t1c@protonmail.com")

(setq doom-font (font-spec :family "monospace" :size 15)
      doom-variable-pitch-font (font-spec :family "Iosevka Aile" :size 15)
      doom-unicode-font (font-spec :family "monospace")
      doom-big-font (font-spec :family "monospace" :size 20))

(setq doom-theme 'doom-gruvbox)
(setq doom-themes-treemacs-theme "doom-colors")

;; Enable global solaire mode
(solaire-global-mode +1)

(setq fancy-splash-image "~/.dotfiles/emacs/.config/doom/linus.png")

(defun my/org/load-prettify-symbols () "Prettify org mode keywords"
  (interactive)
  (setq prettify-symbols-alist
    (mapcan (lambda (x) (list x (cons (upcase (car x)) (cdr x))))
          '(("[ ]"             . ?)
            ("[-]"             . ?)
            ("[X]"             . ?)
            ("#+begin_src"     . ?)
            ("#+end_src"       . ?)
            ("#+begin_example" . ?⌄)
            ("#+end_example"   . ?⌃)
            ("#+begin_quote"   . ?❝)
            ("#+end_quote"     . ?❞)
            ("#+title:"        . ?)
            ("#+date:"         . ?)
            ("#+author:"       . ?)
            ("#+name:"         . ?)
            ("#+caption:"      . ?)
            ("#+results:"      . ?)
            (":properties:"    . ?)
            (":logbook:"       . ?))))
  (prettify-symbols-mode 1))

(after! org
  (add-hook 'org-mode-hook 'my/org/load-prettify-symbols)
  (add-hook 'org-mode-hook 'mixed-pitch-mode 1)
  ;; If you use `org' and don't want your org files in the default location below, change `org-directory'.
  ;; It must be set before org loads!
  (setq org-directory "~/docs/org/"
        ;; Hide things like *text* /text/ etc.
        org-hide-emphasis-markers t
        ;; Change those 3 ugly dots
        org-ellipsis "  "))

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.15))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.05))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)

;; Enable global git gutter mode
(global-git-gutter-mode +1)

(custom-set-variables
 '(git-gutter:update-interval 7))

(setq centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-set-bar 'over)

;; This determines the style of line numbers in effect. If set to `nil', line numbers are disabled.
;; For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Spaces > tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
