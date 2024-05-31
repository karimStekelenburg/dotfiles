;;; projectile.el -*- lexical-binding: t; -*-

(use-package! projectile
  :init
  (setq projectile-project-root-files '(".projectile"))
  (setq projectile-project-root-functions
        '(projectile-root-top-down
          projectile-root-top-down-recurring
          projectile-root-bottom-up
          projectile-root-local)))

(after! projectile
  (projectile-mode +1))
