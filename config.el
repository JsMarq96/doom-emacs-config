;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Juan S. Marquerie (JsMqr96)"
      user-mail-address "jsmarquerie@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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

;; My projects
(projectile-add-known-project "~/Documents/Unnamed-GameEngine/")
(projectile-add-known-project "~/.minecraft/shaderpacks/Upstairs-Shaders")

;; Disable cache when the project is loading
(add-hook 'projectile-after-switch-project-hook (lambda ()
                                                  (projectile-invalidate-cache nil)))

;; Custom configs
(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)
(add-to-list 'auto-mode-alist '("\\.fsh\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vsh\\'" . glsl-mode))

;; GLSL utils
(defun glsl-create-shader(name)
  "Create a fragment and vertex shaders duo"
  (interactive "sShader name: ")
  (shell-command (concat "touch " (concat name ".fsh")))
  (shell-command (concat "touch " (concat name ".vsh")))
  (message "Bada-bing shaders for ya %s" name))

;; (add-function #'glsl-create-shader)

;; Added Discord rich presenece
(require 'elcord)
(elcord-mode)

(require 'multiple-cursors)
(global-set-key (kbd "C-|") 'mc/edit-lines)

;;(add-hook 'find-file-hook #'glsl_config)
;;(defun glsl_config ()
;;  (when (and (stringp buffer-file-name)
;;             (and (string-match "\\.fsh\\'" buffer-file-name)
;;                  (string-match "\\.vsh\\'" buffer-file-name)))
;;el    (glsl-mode true)))
