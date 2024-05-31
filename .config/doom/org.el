;;; org.el -*- lexical-binding: t; -*-

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


(after! org
  (setq org-tag-alist
        '((:startgrouptag)
          ("personal" . ?p)
          (:grouptags)
          ("finance" . ?f)
          ("house" . ?h) ;; Unique shortcut for main house category
          ("computer" . ?c)
          (:endgrouptag)
          (:startgrouptag)
          ("house") ;; Main house tag for grouping
          (:grouptags)
          ("spring_cleaning" . ?s)
          ("broken_shit" . ?b)
          (:endgrouptag)
          (:startgrouptag)
          ("work" . ?w)
          (:grouptags)
          ("xel" . ?x)
          ("exit_animo" . ?e)
          (:endgrouptag)
          (:startgrouptag)
          ("xel_projects" . ?X) ;; Unique name for nested xel group
          (:grouptags)
          ("kameleon" . ?k)
          (:endgrouptag))))

(add-hook 'org-mode-hook
          (lambda ()
            (setq org-tag-alist
                  '((:startgrouptag)
                    ("personal" . ?p)
                    (:grouptags)
                    ("finance" . ?f)
                    ("computer" . ?c)
                    (:endgrouptag)
                    (:startgrouptag)
                    ("house" . ?g) ;; Main house tag for grouping
                    (:grouptags)
                    ("spring_cleaning" . ?s)
                    ("broken_shit" . ?b)
                    (:endgrouptag)
                    (:startgrouptag)
                    ("work" . ?w)
                    (:grouptags)
                    ("xel" . ?x)
                    ("exit_animo" . ?e)
                    (:endgrouptag)
                    (:startgrouptag)
                    ("xel_projects" . ?X) ;; Unique name for nested xel group
                    (:grouptags)
                    ("kameleon" . ?k)
                    (:endgrouptag)))))

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


(use-package! org-super-agenda
  :hook (org-agenda-mode . org-super-agenda-mode)
  )


(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-include-diary t
      org-agenda-block-separator nil
      org-agenda-compact-blocks t
      org-agenda-start-with-log-mode t
      org-agenda-start-day nil)
(setq org-agenda-custom-commands
      '(("d" "Get Things DONE"
         ((agenda "" ((org-agenda-span 1)
                      (org-super-agenda-groups
                       '((:name "Today"
                          :time-grid t
                          :date nil
                          :todo "TODAY"
                          :scheduled nil
                          :order 1)))))
          (alltodo "" ((org-agenda-overriding-header "")
                       (org-super-agenda-groups
                        '((:discard (:todo "TODO"))
                          (:name "Important"
                           :tag "Important"
                           :priority "A"
                           :order 1)
                          (:name "Due Today"
                           :deadline today
                           :order 2)
                          (:name "Due Soon"
                           :deadline future
                           :order 8)
                          (:name "Overdue"
                           :deadline past
                           :order 7)
                          (:name "Thesis"
                           :tag "thesis"
                           :order 10)
                          (:name "ESN"
                           :tag "esn"
                           :order 12)
                          (:name "JOTE"
                           :tag "jote"
                           :order 13)
                          (:name "Emacs"
                           :tag "emacs"
                           :order 14)
                          (:name "Home"
                           :tag "home"
                           :order 30)
                          (:name "Waiting"
                           :todo "WAITING"
                           :order 20)
                          (:name "Notes"
                           :tag "notes"
                           :order 20)
                                        ;(:name "Open Questions"
                                        ;       :todo "OPEN"
                                        ;       :order 3)
                          (:name "trivial"
                           :priority<= "C"
                           :tag ("Trivial" "Unimportant")
                           :todo ("SOMEDAY" )
                           :order 90)
                          (:discard (:tag ("Chore" "Routine" "Daily")))))))))))
;; Org-projectile
(use-package! org-projectile
  :after (org)
  :config
  (org-projectile-per-project)
  :custom
  (org-projectile-per-project-filepath "TODO.org"))
