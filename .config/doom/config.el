
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Prodip Kumar"
      user-mail-address "prodiptushar01@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18 :weight 'regular)
     doom-unicode-font (font-spec :family "Noto Color Emoji"))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'modus-vivendi-tinted)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/notes/org/")
(setq org-agenda-files '("~/Documents/notes/org/inbox/20220819220526-inbox.org" "~/Documents/notes/org/inbox/20240919232007-tasks.org"))
;; (setq org-agenda-files
;;       (append
;;        (file-expand-wildcards "~/Documents/notes/org/agenda/*.org")))
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (setq org-element-use-cache nil)
;; Lsp

(after! lsp-ui
  (setq lsp-ui-doc-enable t))
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-idle-delay 0.500)
(setq company-idle-delay 0.02)
(setq gc-cons-threshold 100000000)

;; Lsp

;; Debugger


;; (map! :map dap-mode-map
;;       :leader
;;       :prefix ("d" . "dap")
;;       ;; basics
;;       :desc "dap next"          "n" #'dap-next
;;       :desc "dap step in"       "i" #'dap-step-in
;;       :desc "dap step out"      "o" #'dap-step-out
;;       :desc "dap continue"      "c" #'dap-continue
;;       :desc "dap hydra"         "h" #'dap-hydra
;;       :desc "dap debug restart" "r" #'dap-debug-restart
;;       :desc "dap debug"         "s" #'dap-debug

;;       ;; debug
;;       :prefix ("dd" . "Debug")
;;       :desc "dap debug recent"  "r" #'dap-debug-recent
;;       :desc "dap debug last"    "l" #'dap-debug-last

;;       ;; eval
;;       :prefix ("de" . "Eval")
;;       :desc "eval"                "e" #'dap-eval
;;       :desc "eval region"         "r" #'dap-eval-region
;;       :desc "eval thing at point" "s" #'dap-eval-thing-at-point
;;       :desc "add expression"      "a" #'dap-ui-expressions-add
;;       :desc "remove expression"   "d" #'dap-ui-expressions-remove

;;       :prefix ("db" . "Breakpoint")
;;       :desc "dap breakpoint toggle"      "b" #'dap-breakpoint-toggle
;;       :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
;;       :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
;;       :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message)

;; (after! dap-mode
;;   (setq dap-python-debugger 'debugpy))

;; Debugger


;; Roam

(setq! org-roam-directory "~/Documents/notes/org/")
(setq! ispell-complete-word-dict "/home/prodip/.cache/words")
(setq! company-ispell-dictionary "/home/prodip/.cache/words")
(setq! ispell-program-name "/usr/bin/aspell")
(use-package! org-roam
  :config
  (setq org-roam-complete-everywhere nil
        org-roam-capture-templates '(
                                     ("d" "default" plain
                                      "%?"
                                      :if-new (file+head "inbox/%<%Y%m%d%H%M%S>-${slug}.org" " ${title}\n")
                                      :unnarrowed t)
                                     )

        org-roam-dailies-capture-templates
                '(("d" "default" entry "* %<%I:%M %p> %?" :target
                   (file+head "%<%Y-%m-%d>.org" "%<%Y-%m-%d>\n")))

        )
  )

(defun md-to-org-region (start end)
  "Convert region from markdown to org"
  (interactive "r")
  (shell-command-on-region start end "pandoc -f markdown -t org" t t))

   (setq org-link-frame-setup
   '((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file-other-window)
     (wl . wl-other-frame)))

;; (use-package! org-roam
;;   :config
;;   (setq org-roam-complete-everywhere t
        ;; org-roam-node-display-template (concat "${title:*} " (propertize "${tags:30}" 'face 'org-tag))
;;         org-roam-capture-templates
;;                 '(("d" "default" plain
;;                    "%?"
;;                    :if-new (file+head "Inbox/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
;;                    :unnarrowed t)
;;                   ("s" "study notes" plain
;;                    (file "/home/prodip/Document/org-notes/Templates/StudyTemplate.org")
;;                    :if-new (file+head "Study/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
;;                    :unnarrowed t)
;;                   ("b" "blog" plain
;;                    "%?"
;;                    :if-new (file+head "blogs/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
;;                    :unnarrowed t)
;;                   ("n" "email newsletter" plain
;;                    (file "/home/prodip/Document/org-notes/Templates/Default.org")
;;                    :if-new (file+head "Inbox/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :newsletter:\n#+date: %<%Y-%m-%d>\n")
;;                    :unnarrowed t)
;;                   ("p" "project" plain
;;                    (file "/home/prodip/Document/org/org-notes/Templates/ProjectTemplate.org")
;;                    :if-new (file+head "Projects/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
;;                    :unnarrowed t))
;;         org-roam-dailies-capture-templates
;;                 '(("d" "default" entry "* %<%I:%M %p> %?" :target
;;                    (file+head "%<%Y-%m-%d>.org" "%<%Y-%m-%d>\n")))
;; ))

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; Roam


;; Mail

;; Whithout this line under , mu4e does not seams to work in doom emacs
;; (setq mu4e-headers-buffer-name "*mu4e-headers*")

;; (setq mu4e-index-cleanup nil
;;       mu4e-index-lazy-check t
;;       mu4e-get-mail-command "mbsync -qa"
;;       mu4e-update-interval 300
;;       mu4e-maildir "~/.local/share/mail/prodiptushar01@gmail.com/"
;;       )
;; (setq +mu4e-gmail-accounts '(("prodiptushar01@gmail.com" . "/prodip")))
;; (setq smtpmail-stream-type 'starttls)
;; (setq smtpmail-default-smtp-server "smtp.gmail.com")
;; (setq smtpmail-smtp-server "smtp.gmail.com")
;; (setq smtpmail-smtp-service 587)
;; (setq smtpmail-debug-info t)
;; (add-to-list 'load-path "/home/prodip/.config/emacs/modules/email/mu4e/")
;; (setq auth-sources '(password-store))
;; (setq auth-source-debug t)
;; (setq auth-source-do-cache nil)
;; (setq sendmail-program "/usr/bin/msmtp"
;;       send-mail-function #'smtpmail-send-it
;;       message-sendmail-f-is-evil t
;;       smtpmail-smtp-user "prodip"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       message-sendmail-extra-arguments '("--read-envelope-from")
;;       message-send-mail-function #'message-send-mail-with-sendmail)

;; Mail
;;



;; quickscope
(global-evil-quickscope-mode 1)
;; quickscope

;; Key Bindings
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

(map! :n "s" 'evil-avy-goto-char-timer)

;; (map! :leader
;;       :desc "Zoxide find file"
;;       "f z" #'zoxide-find-file)

(map! :leader
      :desc "comment like vim"
      "/" #'comment-line)

;; (map! "M-/" #'+default/search-project)

(map! :leader
      :desc "Doom Home"
      "b h" #'scratch-buffer)


(define-key evil-insert-state-map (kbd "C-l") 'forward-char)
(define-key evil-insert-state-map (kbd "C-h") 'backward-char)
(define-key evil-normal-state-map (kbd "s") 'evil-avy-goto-char-timer)

;; Key Bindings

;;(require 'cc-mode)

;; openwith package
    ;; (when (require 'openwith nil 'noerror)
    ;;   (setq openwith-associations
    ;;         (list
    ;;          (list (openwith-make-extension-regexp
    ;;                 '("mpg" "mpeg" "mp3" "mp4"
    ;;                   "avi" "webm" "wav" "mov" "flv"
    ;;                   "ogm" "ogg" "mkv"))
    ;;                "mpv"
    ;;                '(file))
    ;;          (list (openwith-make-extension-regexp
    ;;                 '("xbm" "pbm" "pgm" "ppm" "pnm"
    ;;                   "png" "gif" "bmp" "tif" "jpeg" "jpg"))
    ;;                "sxiv"
    ;;                '(file))
    ;;          (list (openwith-make-extension-regexp
    ;;                 '("doc" "xls" "ppt" "odt" "ods" "odg" "odp"))
    ;;                "libreoffice"
    ;;                '(file))
    ;;          '("\\.lyx" "lyx" (file))
    ;;          '("\\.chm" "kchmviewer" (file))
    ;;          (list (openwith-make-extension-regexp
    ;;                 '("pdf" "ps" "ps.gz" "dvi"))
    ;;                "okular"
    ;;                '(file))
    ;;          ))
    ;;   (openwith-mode 1))
;; openwith package
(setq +latex-viewers '(zathura))
;; elfeed
;; (setq rmh-elfeed-org-files (list "~/Documents/notes/org/elfeed.org"))

(setq elfeed-feeds
      '(
        "https://www.youtube.com/feeds/videos.xml?channel_id=UC1KmNKYC1l0stjctkGswl6g"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCoOae5nYA7VqaXzerajD0lg"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCNjPtOCvMrKY5eLwr_-7eUg"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCsNxHPbaCWL1tKw2hxGQD6g"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCnpekFV93kB1O0rVqEKSumg"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UC2Xd-TjJByJyK2w1zNwY0zQ"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCngn7SVujlvskHRvRKc1cTw"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCe3qdG0A_gr-sEdat5y2twQ"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCPHpx55tgrbm8FrYYCflAHw"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCWQaM7SpSECp9FELz-cHzuQ"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCwVEhEzsjLym_u1he4XWFkg"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCNXapAc8mXTwW82MTncdfzQ"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCsBjURrPoezykLs9EqgamOA"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCurYxozQbvKn-oNUxNJh45Q"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCgBg0aacyJnw4qUnb1FlfEQ"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCHn_K1zOBYZqtmIYkXLEIQw"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCkKh0mX-A5uTbk60YutGFxg"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCVOTBwF0vnSxMRIbfSE_K_g"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCbYmF43dpGHz8gi2ugiXr0Q"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UC0TnW9acNxqeojxXDMbohcA"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UC6QYFutt9cluQ3uSM963_KQ"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCNI0qOojpkhsUtaQ4_2NUhQ"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCir93b_ftqInEaDpsWYbo_g"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCwAdQUuPT6laN-AQR17fe1g"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCfx8btclgvQHEBT3b0eBHWA"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UC3bLxUg5G7D8ImDI9V_f2qg"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UC1DTYW241WD64ah5BFWn4JA"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCfhbydY40P2Lli9HuBz8cdA"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UC8ENHE5xdFSwx71u3fDH5Xw"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCY5pzcvC5GtpdhOQe6KQqmg"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCFbNIlppjAuEX4znoulh0Cw"
        ))

(after! elfeed
  (setq elfeed-curl-program-name "/usr/bin/curl")
  (setq elfeed-search-filter "@3-month-ago")
)

(add-hook! 'elfeed-search-mode-hook #'elfeed-update)
;; elfeed
;;
;; tailwind
;; (use-package! lsp-tailwindcss
;;   :init
;;   (setq! lsp-tailwindcss-experimental-class-regex ["tw`([^`]*)" "tw=\"([^\"]*)" "tw={\"([^\"}]*)" "tw\\.\\w+`([^`]*)" "tw\\(.*?\\)`([^`]*)"])
;;   (setq! lsp-tailwindcss-add-on-mode t))
;; (after! lsp-tailwindcss
;;   (setq lsp-tailwindcss-major-modes '(typescript-tsx-mode rjsx-mode web-mode html-mode css-mode svelte-mode)))

;; tailwind

;; company mode
(setq company-global-modes '(not vterm))
(global-ede-mode 1)
(semantic-mode 1)
(setq! +evil-want-o/O-to-continue-comments nil)
;; company mode


;; info mode
(set-popup-rule! "^\\*info\\*$" :ignore t)
(setq! org-clock-sound "~/.config/doom/ding.wav")
;; info mode

;; yt
(use-package elfeed-tube
  :after elfeed
  :demand t
  :config
  ;; (setq elfeed-tube-auto-save-p nil) ; default value
  ;; (setq elfeed-tube-auto-fetch-p t)  ; default value
  (elfeed-tube-setup)
  :bind (:map elfeed-show-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)
         :map elfeed-search-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)))
;; yt

;; (use-package org-mind-map
;;   :init
;;   (require 'ox-org)
;;   ;; Uncomment the below if 'ensure-system-packages` is installed
;;   ;;:ensure-system-package (gvgen . graphviz)
;;   :config
;;   (setq org-mind-map-engine "dot")       ; Default. Directed Graph
;;   ;; (setq org-mind-map-engine "neato")  ; Undirected Spring Graph
;;   ;; (setq org-mind-map-engine "twopi")  ; Radial Layout
;;   ;; (setq org-mind-map-engine "fdp")    ; Undirected Spring Force-Directed
;;   ;; (setq org-mind-map-engine "sfdp")   ; Multiscale version of fdp for the layout of large graphs
;;   ;; (setq org-mind-map-engine "twopi")  ; Radial layouts
;;   ;; (setq org-mind-map-engine "circo")  ; Circular Layout
;;   )
;; (after! persp-mode
;;   (setq persp-emacsclient-init-frame-behaviour-override "main")
;;   )



;; (use-package! xclip
;;   :config
;;   (setq xclip-program "wl-copy")
;;   (setq xclip-select-enable-clipboard t)
;;   (setq xclip-mode t)
;;   (setq xclip-method (quote wl-copy)))


;;(setq interprogram-paste-function
;;      (lambda ()
;;        (shell-command-to-string "wl-paste")))

;; personal scripts

(setq eww-search-prefix "https://www.startpage.com/sp/search?query=")

;; (setq eww-search-prefix "https://duckduckgo.com/html/?q=")

(defun cust/vsplit-file-open (f)
  (let ((evil-vsplit-window-right 'nil))
    (+evil/window-vsplit-and-follow)
    (find-file f)))

(map! :after embark
      :map embark-file-map
      "V" #'cust/vsplit-file-open)

(map! :after org
      :map org-mode-map
      "C-h" #'backward-char)

(map! :after org
      :map org-mode-map
      "C-l" #'forward-char)

(map! :leader
      "om" #'+prodip/markdown-notes-search
      )

(defcustom markdown-directory "~/Documents/notes/markdown"
  "Directory with markdown files.
This is just a default location to look for Markdown files.  There is no need
at all to put your files into this directory.  It is used in the
following situations:

1. When a capture template specifies a target file that is not an
   absolute path.  The path will then be interpreted relative to
   `markdown-directory'
2. When the value of variable `markdown-agenda-files' is a single file, any
   relative paths in this file will be taken as relative to
   `markdown-directory'."
  :group 'org-refile
  :group 'org-capture
  :type 'directory)

(setq! markdown-directory "~/Documents/notes/markdown")

(defun +prodip/markdown-notes-search (query)
  "Perform a text search on `org-directory'."
  (interactive
   (list (if (doom-region-active-p)
             (buffer-substring-no-properties
              (doom-region-beginning)
              (doom-region-end))
           "")))
  (require 'markdown-mode)
  (+default/search-project-for-symbol-at-point
   query markdown-directory))


;; personal scripts

;; Better org
;; (add-hook 'org-mode-hook (lambda () (display-line-numbers-mode -1)))
;; (add-hook 'org-mode-hook #'org-modern-mode)
;; (add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

;; (setq! org-startup-indented t
;;                   org-pretty-entities t
;;                   org-use-sub-superscripts "{}"
;;                   org-hide-emphasis-markers t
;;                   org-startup-with-inline-images t
;;                   org-image-actual-width '(300))

;; (use-package org-appear
;;     :hook
;;     (org-mode . org-appear-mode))

;; (use-package olivetti
;; :hook (org-mode . olivetti-mode))

;; (let* (
;;        (variable-lower
;;         (cond ((x-list-fonts "FiraCode Nerd Font") '(:font "FiraCode Nerd Font"))))
;;        (headline           `(:weight bold))
;;        (headline-lower           `(:weight semibold))
;;        )

;;   (custom-theme-set-faces
;;    'user
;;    `(org-level-8 ((t (,@headline-lower ,@variable-lower))))
;;    `(org-level-7 ((t (,@headline-lower ,@variable-lower :height 1.25))))
;;    `(org-level-6 ((t (,@headline-lower ,@variable-lower :height 1.35))))
;;    `(org-level-5 ((t (,@headline-lower ,@variable-lower :height 1.45))))
;;    `(org-level-4 ((t (,@headline-lower ,@variable-lower :height 1.55))))
;;    `(org-level-3 ((t (,@headline-lower ,@variable-lower :height 1.75))))
;;    `(org-level-2 ((t (,@headline-lower ,@variable-lower :height 1.85))))
;;    `(org-level-1 ((t (,@headline-lower ,@variable-lower :height 2.0))))
;;    `(org-document-title ((t (,@headline ,@variable-lower :height 3.0 :underline nil))))))

;; (custom-theme-set-faces
;;  'user
;;  '(variable-pitch ((t (:family "ETBembo" :height 30 :weight bold))))
;;  '(fixed-pitch ((t ( :family "FiraCode Nerd Font" :height 15)))))

;; (defun my-adjoin-to-list-or-symbol (element list-or-symbol)
;;   (let ((list (if (not (listp list-or-symbol))
;;                   (list list-or-symbol)
;;                 list-or-symbol)))
;;     (require 'cl-lib)
;;     (cl-adjoin element list)))

;; (eval-after-load "org"
;;   '(mapc
;;     (lambda (face)
;;       (set-face-attribute
;;        face nil
;;        :inherit
;;        (my-adjoin-to-list-or-symbol
;;         'fixed-pitch
;;         (face-attribute face :inherit))))
;;     (list 'org-code 'org-block 'org-table)))


    ;; (setq-default org-download-image-dir "~/Documents/notes/org/org-notes/Assets")
;; Better org
(setq! org-download-screenshot-method "wl-paste > %s")


;; (define-derived-mode astro-mode web-mode "astro")
;; (setq auto-mode-alist
;;       (append '((".*\\.astro\\'" . astro-mode))
;;               auto-mode-alist))

;; (with-eval-after-load 'lsp-mode
;;   (add-to-list 'lsp-language-id-configuration
;;                '(astro-mode . "astro"))

;;   (lsp-register-client
;;    (make-lsp-client :new-connection (lsp-stdio-connection '("astro-ls" "--stdio"))
;;                     :activation-fn (lsp-activate-on "astro")
;;                     :server-id 'astro-ls)))

;; (use-package! treesit-auto
;;   :custom
;;   (treesit-auto-install 'prompt)
;;   :config
;;   (treesit-auto-add-to-auto-mode-alist 'all)
;;   (global-treesit-auto-mode))
