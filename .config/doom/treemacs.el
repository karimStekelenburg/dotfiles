;;; treemacs.el -*- lexical-binding: t; -*-
(add-hook! 'after-init-hook #'treemacs)

(after! treemacs
(add-hook! 'treemacs-mode-hook (setq window-divider-mode -1
                                     variable-pitch-mode 1
                                     treemacs-follow-mode 1))
)
