;;; emacs-org-babel-conf-test.el --- Tests for emacs-org-babel-conf
;; Copyright (C) 2019 Pierre Penninckx

;; Author: Pierre Penninckx <ibizapeanut@gmail.com>

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

;;; Code:

(require 'emacs-org-babel-conf)

(ert-deftest emacs-org-babel-conf-can-replace ()
  "Tests finding conflict file."
  (should (equal
		   (with-temp-buffer
			 (insert "#+begin_src conf :var hello=\"world\"\n"
					 "one=1\n"
					 "two=$hello\n"
					 "#+end_src\n")
			 (org-babel-expand-src-block))
		   "one=1\ntwo=world")))

(provide 'emacs-org-babel-conf-test)

;;; emacs-org-babel-conf-test.el ends here
