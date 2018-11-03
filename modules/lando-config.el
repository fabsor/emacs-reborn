(defun lando (command)
  (interactive "scommand:")
  (setq command (format "lando %s" command))
  (async-shell-command command))

(defun lando-start ()
  (interactive)
  (lando "start"))

(defun lando-rebuild ()
  (interactive)
  (lando "rebuild"))

(provide 'lando-config)
