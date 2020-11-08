;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     python
     hyliu
     html
     graphviz
     csv
     c-c++
     latex
     bibtex
     auto-completion
     (auto-completion :variables
                      auto-completion-enable-help-tooltip 'manual
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/"
                      )

     ;;ivy
     (better-defaults :variables
                      better-defaults-move-to-end-of-code-first nil
                      )
     emacs-lisp
     git
     markdown
     osx
     org
     (org :variables
          org-want-todo-bindings t)
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(cdlatex)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(nlinum-layer)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t 

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; Darktooth theme is the default theme
  ;; Each theme is automatically installed.
  ;; Note that we drop the -theme from the package name.
  ;; Ex. darktooth-theme -> darktooth
  (setq-default dotspacemacs-themes '(
                                      monokai
                                      ;;solarized-dark
                                      ;;spacemacs-light
                                      ;;zenburn
                                      ;;moe-dark
                                      ;;moe-light
                                      ;;darktooth
                                      ;;soothe
                                      ;;gotham
                                      ))
  (setq markdown-command "/usr/local/Cellar/pandoc/2.7.3/bin/pandoc")
  ;; 国内源 BEGIN
  ;; 猪场
  ;;(setq configuration-layer-elpa-archives
  ;;      '(("melpa-cn" . "http://mirrors.163.com/elpa/melpa/")
  ;;        ("org-cn"   . "http://mirrors.163.com/elpa/org/")
  ;;        ("gnu-cn"   . "http://mirrors.163.com/elpa/gnu/")))
  ;;
  ;; 鹅厂
   (setq configuration-layer-elpa-archives
         '(("melpa-cn" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
           ("org-cn"   . "http://mirrors.cloud.tencent.com/elpa/org/")
           ("gnu-cn"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")))
  ;; 清华
  ;; (setq configuration-layer-elpa-archives
  ;;       '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
  ;;         ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
  ;;         ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
  ;; Emacs China
  ;; (setq configuration-layer-elpa-archives
  ;;       '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
  ;;         ("org-cn"   . "http://elpa.emacs-china.org/org/")
  ;;         ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

  ;;(setq url-proxy-services '(("no_proxy" . "127.0.0.1")
  ;;                         ("SOCKS5" . "127.0.0.1:1080")
  ;;                         ("SOCKS5" . "127.0.0.1:1080")
  ;;                         ))
  ;; 国内源 END

  ;; 表格等宽 Begin
  ;; 等宽: Source Code Pro 13 + STkaiti 16
   (setq face-font-rescale-alist `(("STkaiti" . ,(/ 16.0 13))))
   (set-face-attribute 'default nil :font "Source Code Pro-13")
   (set-fontset-font t 'han      (font-spec :family "STkaiti"))
   (set-fontset-font t 'cjk-misc (font-spec :family "STkaiti"))
  ;; 表格等宽 End
   
  ;;(setq org-reveal-root "file:///Users/liusixu/Documents/ProgramCode/reveal.js/")
  (setq org-reveal-root "https://cdn.bootcss.com/reveal.js/3.8.0/")

  (setq tramp-ssh-controlmaster-options
         "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  ;;(setq tab-width 4)
  (setq c-basic-offset 4)

  (setq-default dotspacemacs-configuration-layers
                 '((org :variables org-projectile-file "~/org-notes/NextToDo.org")))
  (setq-default dotspacemacs-configuration-layers
                 '((latex :variables latex-build-command "XeLaTeX" latex-enable-auto-fill t latex-enable-folding t latex-enable-magic nil)))
)
(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; 修改org-mode下latex公式浏览大小
  ;; Enlarge LaTeX Fragment in Org-mode
  ;; Put this inside `dotspacemacs/user-config`
  (require 'org)
  (plist-put org-format-latex-options :scale 1.5)
  (setq spaceline-org-clock-p t)
  ;; org-mode 自动缩进
  (setq org-startup-indented t)

  ;;全局参考文献位置
  (setq reftex-default-bibliography '("~/hyliuTmpDir/Papers/references.bib"))
  (setq org-ref-default-bibliography '("~/hyliuTmpDir/Papers/references.bib")
        org-ref-pdf-directory "~/hyliuTmpDir/Papers/"
        org-ref-bibliography-notes "~/hyliuTmpDir/Papers/notes.org")

  ;; 设置f7为透明度增加 f8透明度降低
  (global-set-key (kbd "<f7>") 'spacemacs/increase-transparency)
  (global-set-key (kbd "<f8>") 'spacemacs/decrease-transparency)

  ;; 设置C-c m为avy-org-refile-as-child
  (global-set-key (kbd "C-c m") 'avy-org-refile-as-child)

  ;; 设置打开当前buffer的文件夹的快捷方式
  (global-set-key (kbd "C-c o") (kbd "M-! open SPC ./"))
  ;; 设置打开当前buffer的terminal的快捷方式
  (global-set-key (kbd "C-c t") (kbd "M-! open SPC -a SPC terminal SPC  ./"))

  ;; 额外配置 better defaults layer
  (define-key evil-insert-state-map (kbd "C-e") 'mwim-end-of-code-or-line)
  (define-key evil-motion-state-map (kbd "C-e") 'mwim-end-of-code-or-line)

  ;;将jk等价于esc键位 
  (setq-default evil-escape-key-sequence "jk")

  ;;(setq org-bullets-bullet-list '("🐳" "🐬" "🐡" "🐟" "🦀" "🦞"))

  ;;(setq-default dotspacemacs-configuration-layers
  ;;              '((org :variables org-projectile-file "~/org-notes/task.org")))

    ;; org-mode环境下增加换行
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))


  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  ;;设置任务状态
  (setq org-todo-keywords
        '((sequence "TODO(t!)" "NEXT(n)" "WAITTING(w)" "SOMEDAY(s)" "|" "DONE(d@/!)" "ABORT(a@/!)")
          ))

  ;; define the refile targets
  (defvar org-agenda-dir "" "gtd org files location")
  (setq-default org-agenda-dir "~/org-notes")

  ;; 设置org-mobile内容
  ;; Set to the location of your Org files on your local system
  (setq-default org-directory "~/org-notes")
  ;; Set to the name of the file where new notes will be stored
  (setq-default org-mobile-inbox-for-pull (expand-file-name "Inbox.org" org-agenda-dir))
  ;; Set to <your Dropbox root directory>/MobileOrg.
  (setq-default org-mobile-directory "~/Dropbox/应用/MobileOrg")

  (setq org-agenda-file-inbox (expand-file-name "Inbox.org" org-agenda-dir))
  (setq org-agenda-file-finished (expand-file-name "finished.org" org-agenda-dir))
  (setq org-agenda-file-project (expand-file-name "PlanProjectTask.org" org-agenda-dir))
  (setq org-agenda-file-CheckList (expand-file-name "CheckList.org" org-agenda-dir))
  (setq org-agenda-file-NextToDo (expand-file-name "@ContextTask.org" org-agenda-dir))
  (setq org-agenda-file-Resource (expand-file-name "Reference.org" org-agenda-dir))
  (setq org-agenda-file-WaitingList (expand-file-name "WaitingForTask.org" org-agenda-dir))
  (setq org-agenda-file-reminders (expand-file-name "reminders.org" org-agenda-dir))
  (setq org-agenda-file-someday (expand-file-name "someday.org" org-agenda-dir))

  (setq org-agenda-files (list org-agenda-dir))
  (with-eval-after-load 'org-agenda
    (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
    (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
      "." 'spacemacs/org-agenda-transient-state/body)
    )
  ;; the %i would copy the selected text into the template
  ;;http://www.howardism.org/Technical/Emacs/journaling-org.html
  ;;add multi-file journal
  (setq org-capture-templates
        '(
          ("n" "Quick note" entry(file+headline org-agenda-file-inbox "Inbox")
           "* %? \n  %i\n %U"
           :empty-lines 1)
          ("i" "Idea" entry (file+headline org-agenda-file-inbox "Inbox")
           "* %? %i\n %U \n %a"
           :empty-lines 1)
        )
   )

  (setq org-refile-targets (quote (("~/org-notes/PlanProjectTask.org" :level . 1)
                                   ("~/org-notes/finished.org" :level . 1)
                                   ("~/org-notes/someday.org" :level . 1)
                                   ("~/org-notes/@ContextTask.org" :level . 1)
                                   ("~/org-notes/WaitingList.org" :level . 1)
                                   ("~/org-notes/Reference.org" :level . 1)
                                   ("~/org-notes/reminders.org" :level . 1)
                                   )))
  ;;An entry without a cookie is treated just like priority ' B '.
  ;;So when create new task, they are default 重要且紧急
  ;;"-Weekly-Monthly-Daily+PRIORITY=\"B\""
  (setq org-agenda-custom-commands
        '(
          ("w" . "任务安排")
          ("wp" "Phone" tags-todo "+@Phone")
          ("wI" "Ipad" tags-todo "+@Ipad")
          ("wc" "Computer" tags-todo "+@Computer")
          ("wl" "Lab" tags-todo "+@Lab")
          ("wd" "Dormitory" tags-todo "+@Dormitory")
          ("wi" "Internet" tags-todo "+@Internet")
          ("wo" "OutDoor" tags-todo "+@OutDoor")
          ("wh" "HighSpeedTrain" tags-todo "+@HighSpeedTrain")
          ("wr" "Read" tags-todo "+@Read")

          ("W" "Weekly Review"
           ((stuck "") ;; review stuck projects as designated by org-stuck-projects
            (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
            ))))

  ;; ditaa 绘图
  (setq org-ditaa-jar-path "~/.spacemacs.d/jarPackage/ditaa0_9.jar");
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((ditaa . t) ; this line activates ditaa
     (plantuml . t) ; this line activates plantuml
     (python . t)
     (dot . t)
     (perl . t)
     (ruby . t)
     (R . t)
     (gnuplot . t)
     (org . t)
     (latex . t)
     (java . t)
     (emacs-lisp . t)
     (calc . t)
     (sql . t)
     ))
  ;; ~~ ==变为红色
  (setq org-emphasis-alist
        (cons '("~" '(:emphasis t :foreground "VioletRed3"))
              (delete* "~" org-emphasis-alist :key 'car :test 'equal)))
  (setq org-emphasis-alist
        (cons '("=" '(:emphasis t :foreground "VioletRed3"))
              (delete* "=" org-emphasis-alist :key 'car :test 'equal)))

  ;; (setq org-image-actual-width (/ (display-pixel-width) 3))
  (setq org-image-actual-width '(200))

  ;;自动追踪子任务完成情况更改TODO
  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

  ;;设置latex 默认编译器为xelatex
  ;;(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
  ;;                              "xelatex -interaction nonstopmode %f"))
  (setq org-latex-default-packages-alist
        (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))
  ;;org-export latex
  (require 'ox-latex)
  (add-to-list 'org-latex-classes
             '("IEEEACCESS"
               "\\documentclass{ieeeaccess}
                \\usepackage{cite}
                \\usepackage{amsmath,amssymb,amsfonts}
                \\usepackage{algorithmic}
                \\usepackage{graphicx}
                \\usepackage{textcomp}"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("AAAI2021"
                 "\\def\\year{2021}\\relax
\\documentclass[letterpaper]{article} % DO NOT CHANGE THIS
\\usepackage{aaai21}  % DO NOT CHANGE THIS
\\usepackage{times}  % DO NOT CHANGE THIS
\\usepackage{helvet} % DO NOT CHANGE THIS
\\usepackage{courier}  % DO NOT CHANGE THIS
\\usepackage{hyperref}  
\\usepackage[hyphens]{url}  % DO NOT CHANGE THIS
\\usepackage{graphicx} % DO NOT CHANGE THIS
\\urlstyle{rm} % DO NOT CHANGE THIS
\\def\\UrlFont{\\rm}  % DO NOT CHANGE THIS
\\frenchspacing  % DO NOT CHANGE THIS
\\setlength{\\pdfpagewidth}{8.5in}  % DO NOT CHANGE THIS
\\setlength{\\pdfpageheight}{11in}  % DO NOT CHANGE THIS
\\setcounter{secnumdepth}{0} %May be changed to 1 or 2 if section numbers are desired.
\\setlength\\titlebox{2.5in} % If your paper contains an overfull \vbox too high warning at the.
%PDF Info Is REQUIRED.
% For /Author, add all authors within the parentheses, separated by commas. No accents or commands.
% For /Title, add Title in Mixed Case. No accents or commands. Retain the parentheses.
\\pdfinfo{
/Title (Knowledge Concept Representation Learning Based on Students Exercise Sequence)
/Author (anonymous)
/TemplateVersion (2021.1)
} %Leave this
"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-list-file-prefix "/Users/hyliu/.emacs.d/.cache/auto-save/")
 '(auto-save-timeout 3)
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(org-agenda-files
   (quote
    ("/Users/hyliu/org-notes/@ContextTask.org" "/Users/hyliu/org-notes/CheckList.org" "/Users/hyliu/org-notes/Inbox.org" "/Users/hyliu/org-notes/PlanProjectTask.org" "/Users/hyliu/org-notes/Reference.org" "/Users/hyliu/org-notes/WaitingForTask.org" "/Users/hyliu/org-notes/finished.org" "/Users/hyliu/org-notes/index.org" "/Users/hyliu/org-notes/reminders.org" "/Users/hyliu/org-notes/someday.org")))
 '(org-download-screenshot-file "~/hyliuTmpDir/OrgDownloadDir/Screenshot.png")
 '(org-tags-exclude-from-inheritance (quote ("spacemacs" "English" "Health" "Sport")))
 '(package-selected-packages
   (quote
    (stickyfunc-enhance pyvenv epc ctable concurrent helm-gtags helm-cscope xcscope ggtags counsel-gtags counsel swiper anaconda-mode pythonic dap-mode posframe bui with-editor transient dash cdlatex yaml-mode utop tuareg caml seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv rake ocp-indent ob-elixir nodejs-repl mvn minitest meghanada maven-test-mode lsp-ui lsp-treemacs lsp-python-ms lsp-java livid-mode skewer-mode json-navigator hierarchy json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc helm-lsp groovy-mode groovy-imports pcache gradle-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter flycheck-ocaml merlin flycheck-mix flycheck-credo emojify emoji-cheat-sheet-plus dune diff-hl cquery company-tern tern company-lsp company-emoji chruby ccls lsp-mode dash-functional bundler inf-ruby browse-at-remote auto-complete-rst alchemist elixir-mode youdao-dictionary yasnippet-snippets yapfify ws-butler writeroom-mode winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill treemacs-projectile treemacs-magit treemacs-evil toc-org tagedit symon symbol-overlay string-inflection spaceline-all-the-icons smeargle slim-mode scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-delimiters pytest pyenv-mode py-isort pug-mode prettier-js popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer osx-trash osx-dictionary osx-clipboard orgit org-ref org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-bullets org-brain open-junk-file nameless mwim move-text monokai-theme mmm-mode markdown-toc magit-svn magit-gitflow macrostep lorem-ipsum live-py-mode link-hint launchctl indent-guide importmagic impatient-mode hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-ls-git helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag graphviz-dot-mode google-translate google-c-style golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy font-lock+ flyspell-correct-helm flycheck-ycmd flycheck-rtags flycheck-pos-tip flycheck-package flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu emmet-mode elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-modeline disaster diminish devdocs cython-mode csv-mode cpp-auto-include company-ycmd company-web company-statistics company-rtags company-reftex company-quickhelp company-c-headers company-auctex company-anaconda column-enforce-mode clean-aindent-mode clang-format centered-cursor-mode blacken auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
