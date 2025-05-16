(straight-use-package 'gptel)

(setq
 gptel-model 'claude-3-sonnet-20240229 ;  "claude-3-opus-20240229" also available
 gptel-backend (gptel-make-anthropic "Claude"
                                     :stream t :key (getenv "ANTHROPIC_API_KEY")  ))
