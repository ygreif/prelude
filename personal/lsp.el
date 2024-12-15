(setq lsp-file-watch-ignored '("[/\\\\]\\.git$"
                               "[/\\\\]\\data$"
                               "[/\\\\]\\gpu$"
                              "[/\\\\]\\.hg$"
                              "[/\\\\]\\.bzr$"
                              "[/\\\\]_darcs$"
                              "[/\\\\]\\.svn$"
                              "[/\\\\]_build$"
                              "[/\\\\]\\.idea$"
                              "[/\\\\]\\.ensime_cache$"
                              "[/\\\\]\\.eunit$"
                              "[/\\\\]node_modules$"
                              "[/\\\\]\\.fslckout$"
                              "[/\\\\]\\.tox$"
                              "[/\\\\]\\.stack-work$"
                              "[/\\\\]\\.bloop$"
                              "[/\\\\]\\.metals$"
                              "[/\\\\]target$"
                              "[/\\\\]\\.ccls-cache$"
                              "[/\\\\]\\.vscode$"
                              "[/\\\\]\\.deps$"
                              "[/\\\\]build-aux$"
                              "[/\\\\]autom4te.cache$"
                              "[/\\\\]venv\\'"
                              "[/\\\\]\\.reference$"))


(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))  ; or lsp-deferred
