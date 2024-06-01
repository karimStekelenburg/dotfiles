;;; yabai.el -*- lexical-binding: t; -*-


;; These keybindings are tightly coupled with those configured
;; in .skhdrc. It ensures we can use the same keybindings for moving
;; window focus in Emacs as in macOs (using yabai).

(defun yabai-move-on-error (direction move-fn)
  (interactive)
  (condition-case nil
      (funcall move-fn)
    (user-error (start-process "yabai" nil "yabai" "-m" "window" "--focus" direction))))

(defun yabai-window-left ()
  (interactive)
  (yabai-move-on-error "west" #'windmove-left))

(defun yabai-window-right ()
  (interactive)
  (yabai-move-on-error "east" #'windmove-right))

(defun yabai-window-up ()
  (interactive)
  (yabai-move-on-error "north" #'windmove-up))

(defun yabai-window-down ()
  (interactive)
  (yabai-move-on-error "south" #'windmove-down))

;; Using map! for keybindings
(map! :desc "Move window left"  "M-h" #'yabai-window-left
      :desc "Move window down"  "M-j" #'yabai-window-down
      :desc "Move window up"    "M-k" #'yabai-window-up
      :desc "Move window right" "M-l" #'yabai-window-right)
