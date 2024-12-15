(setq tramp-default-method "ssh")
(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='~/.ssh/control-%%r@%%h:%%p' -o ControlPersist=yes")
