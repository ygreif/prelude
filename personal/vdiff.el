(straight-use-package 'vdiff)
(straight-use-package 'vdiff-magit)


(require 'vdiff)

(require 'vdiff-magit)
(define-key magit-mode-map "e" 'vdiff-magit-dwim)
(define-key magit-mode-map "E" 'vdiff-magit)
(transient-suffix-put 'magit-dispatch "e" :description "vdiff (dwim)")
(transient-suffix-put 'magit-dispatch "e" :command 'vdiff-magit-dwim)
(transient-suffix-put 'magit-dispatch "E" :description "vdiff")
(transient-suffix-put 'magit-dispatch "E" :command 'vdiff-magit)


(define-key vdiff-mode-map (kbd "C-c") vdiff-mode-prefix-map)
(define-key vdiff-3way-mode-map (kbd "C-c") vdiff-mode-prefix-map)
;; This flag will default to using ediff for merges.
;; (setq vdiff-magit-use-ediff-for-merges nil)

;; Whether vdiff-magit-dwim runs show variants on hunks.  If non-nil,
;; vdiff-magit-show-staged or vdiff-magit-show-unstaged are called based on what
;; section the hunk is in.  Otherwise, vdiff-magit-dwim runs vdiff-magit-stage
;; when point is on an uncommitted hunk.
;; (setq vdiff-magit-dwim-show-on-hunks nil)

;; Whether vdiff-magit-show-stash shows the state of the index.
;; (setq vdiff-magit-show-stash-with-index t)

;; Only use two buffers (working file and index) for vdiff-magit-stage
;; (setq vdiff-magit-stage-is-2way nil)
