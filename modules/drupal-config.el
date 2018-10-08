(defun drush (command)
  (interactive "scommand:")
  (setq command (format "lando drush %s" command))
  (async-shell-command command))

(defun cache-clear ()
  (interactive)
  (drush "cc all"))

(defun updatedb ()
  (interactive)
  (drush "updatedb -y"))

(provide 'drupal-config)
