(defun my-python-company-settings ()
  "Customize company-mode settings for Python files."
  (setq-local company-idle-delay 0.1) ;; Only for Python
  (setq-local company-minimum-prefix-length 1) ;; Only for Python
  (local-set-key (kbd "<f5>") 'recompile)) ;; Only for Python

(add-hook 'python-mode-hook 'my-python-company-settings)
