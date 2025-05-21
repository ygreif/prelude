(require 'cl)
(let ((pkg-list '( s
		   dash
		   editorconfig
                   company)))

  (when-let ((to-install (map-filter (lambda (pkg _) (not (package-installed-p pkg))) pkg-list)))
    (package-refresh-contents)
    (mapc (lambda (pkg) (package-install pkg)) pkg-list)))

(use-package copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el"
            :rev :newest
            :branch "main"))

;(use-package copilot
 ; :load-path (lambda () (expand-file-name "copilot.el" user-emacs-directory))
  ;; don't show in mode line
  ;:diminish)

(defun rk/no-copilot-mode ()
  "Helper for `rk/no-copilot-modes'."
  (copilot-mode -1))

(defvar rk/no-copilot-modes '(shell-mode
                              inferior-python-mode
                              eshell-mode
                              term-mode
                              vterm-mode
                              comint-mode
                              compilation-mode
                              debugger-mode
                              dired-mode-hook
                              compilation-mode-hook
                              flutter-mode-hook
                              minibuffer-mode-hook)
  "Modes in which copilot is inconvenient.")

(defun rk/copilot-disable-predicate ()
  "When copilot should not automatically show completions."
  (or rk/copilot-manual-mode
      (member major-mode rk/no-copilot-modes)
      (company--active-p)))

(add-to-list 'copilot-disable-predicates #'rk/copilot-disable-predicate)

(defvar rk/copilot-manual-mode nil
"When `t' will only show completions when manually triggered, e.g. via M-C-<return>.")

(defun rk/copilot-change-activation ()
  "Switch between three activation modes:
- automatic: copilot will automatically overlay completions
- manual: you need to press a key (M-C-<return>) to trigger completions
- off: copilot is completely disabled."
  (interactive)
  (if (and copilot-mode rk/copilot-manual-mode)
      (progn
        (message "deactivating copilot")
        (global-copilot-mode -1)
        (setq rk/copilot-manual-mode nil))
    (if copilot-mode
        (progn
          (message "activating copilot manual mode")
          (setq rk/copilot-manual-mode t))
      (message "activating copilot mode")
      (global-copilot-mode))))

(define-key global-map (kbd "M-C-<escape>") #'rk/copilot-change-activation)

(defun rk/copilot-complete-or-accept ()
"Command that either triggers a completion or accepts one if one
is available. Useful if you tend to hammer your keys like I do."
(interactive)
(if (copilot--overlay-visible)
    (progn
      (copilot-accept-completion)
      (open-line 1)
      (next-line))
  (copilot-complete)))

(define-key copilot-mode-map (kbd "M-C-<next>") #'copilot-next-completion)
(define-key copilot-mode-map (kbd "M-C-<prior>") #'copilot-previous-completion)
(define-key copilot-mode-map (kbd "M-C-<right>") #'copilot-accept-completion-by-word)
(define-key copilot-mode-map (kbd "M-C-<down>") #'copilot-accept-completion-by-line)
(define-key global-map (kbd "M-C-<return>") #'rk/copilot-complete-or-accept)

(defun enable-copilot-for-python ()
  "Enable Copilot mode for Python files."
  (interactive)
  (when (eq major-mode 'python-mode)
    (copilot-mode 1)))

(global-set-key (kbd "M-p") 'enable-copilot-for-python)

(add-to-list 'copilot-indentation-alist '(python-mode 2))
