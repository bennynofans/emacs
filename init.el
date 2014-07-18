;;显示行号
(global-linum-mode t)

;;高亮当前行
(require 'hl-line)
(global-hl-line-mode t)

;;去掉欢迎界面
(setq inhibit-startup-message t) 

;;显示光标样式为条型
(setq-default cursor-type 'bar)

;; 显示时间，格式如下
(display-time-mode 1) 
(setq display-time-24hr-format t) 
(setq display-time-day-and-date t) 
(transient-mark-mode t) 

;; 在标题栏显示正在编辑的文件名
(setq frame-title-format "@Emacs %b") 

;; 实现全屏效果，快捷键为f11
(global-set-key [f11] 'my-fullscreen) 
(defun my-fullscreen ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_FULLSCREEN" 0))
)

;; 窗口最大化函数
(defun my-maximized ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
)

;; 启动emacs时窗口最大化
(my-maximized)

;; 在行首 C-k 时，同时删除该行。
(setq-default kill-whole-line t)


;;所有的备份文件都放置在~/backups目录下
;;emacs中，改变文件时，默认都会产生备份文件（以~结尾的文件）。可以完全去掉
;;（并不可取），也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一个
;;固定的地方。对于每个备份文件，保留最原始的两个版本和最新的五个版本。
;;并且备份的时候，备份文件是复件，而不是原件。
(setq backup-directory-alist (quote (("." . "~/backups"))))
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/backups")))
(setq backup-by-copying t)

;;auto-complete插件的配置
(add-to-list 'load-path "~/.emacs.d/extension/auto-complete")
(require 'auto-complete-config)

;;emmet-mode插件配置
(add-to-list 'load-path "~/.emacs.d/extension/emmet-mode")
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(setq emmet-move-cursor-between-quotes t) ;; default nil
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.

;;(add-to-list 'load-path "~/emacs.d/ac-emmet")
;;(require 'ac-emmet) ;; Not necessary if using ELPA package
;;(add-hook 'sgml-mode-hook 'ac-emmet-html-setup)
;;(add-hook 'css-mode-hook 'ac-emmet-css-setup)
