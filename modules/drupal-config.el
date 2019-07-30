(defun drush (command)
  (interactive "scommand:")
  (setq command (format "fab drush '%s'" command))
  (async-shell-command command))

(defun cache-clear ()
  (interactive)
  (drush "cc all"))

(defun updatedb ()
  (interactive)
  (drush "updatedb -y"))

(provide 'drupal-config)
