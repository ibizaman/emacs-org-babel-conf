;;; emacs-org-babel-conf --- org-babel enhancements for conf mode

;; Copyright (C) 2019 Pierre Penninckx

;; Author: Pierre Penninckx <ibizapeanut@gmail.com>
;; URL: https://github.com/ibizaman/emacs-org-babel-confs
;; Version: 0.1.0

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation, either version 3 of the License,
;; or (at your option) any later version.

;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Allows `$symbol` to be replaced by its value using org-babel's
;; ~:var symbol="value"~.

;;; Code:

(require 'org)

(defun org-babel-expand-body:conf (body params)
  "Expand BODY according to the values of vars inside PARAMS.

Values in the form $symbol are expanded to their value from `:var symbol=\"value\"'."
  (mapc
   (lambda (pair)
     (setq body
	   (replace-regexp-in-string
	    (format "$%s" (car pair))
	    (let ((val (cdr pair)))
              (cond ((stringp val) val)
                    (t (format "%S" val))))
            body)))
   (org-babel--get-vars params))
  body)

(provide 'emacs-org-babel-conf)
;;; emacs-org-babel-conf.el ends here
