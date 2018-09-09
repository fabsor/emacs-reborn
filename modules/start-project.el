(defun start-project (project)
  "Start a project by open the project dir and run setup script"
  (interactive "senter project:")
  (find-file (format "~/projects/%s" project))
  (setq setup (format "~/projects/%s/setup.el" project))
  (when (file-exists-p setup) (load-file setup))
)

(provide 'start-project)
