(defun drush (command)
  (interactive "scommand:")
  (setq command (format "dw drush %s" command))
  (async-shell-command command))

(defmacro drush-command (name cmd)
  (list 'defun (intern (format "drush-%s" name)) ()
        (list 'interactive)
        (list 'print (intern cmd))))
;;        (list 'drush (intern (format "%s" command)))))

(drush-command "status" "status")

(defun cache-clear ()
  (interactive)
  (drush "cc all"))

(defun updatedb ()
  (interactive)
  (drush "updatedb -y"))

(provide 'drupal-config)
