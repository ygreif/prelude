(require 'org)

;; Must do this so the agenda knows where to look for my files
(setq org-agenda-files '("~/Dropbox/todos/"))

(setq org-capture-templates
      '(
        ("j" "Work Log Entry"
         entry (file+datetree "~/org/work-log.org")
         "* %?"
         :empty-lines 0)
        ))

;; When a TODO is set to a done state, record a timestamp
(setq org-log-done 'time)


;; Wrap the lines in org mode so that things are easier to read
(add-hook 'org-mode-hook 'visual-line-mode)

(setq org-agenda-prefix-format '((agenda . " %i %-12:c%?-12t% s")
                                 (todo . " %i %-12:c")
                                 (tags . " %i %-12:c")
                                 (search . " %i %-12:c")))

(defun set-category-based-on-top-level-heading ()
  (interactive)
  (org-map-entries
   (lambda ()
     (let ((top-heading (car (org-get-outline-path))))
       (unless (string-equal top-heading (org-entry-get nil "CATEGORY"))
         (org-set-property "CATEGORY" top-heading))))
   nil 'file))

(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

(show-paren-mode 1)
