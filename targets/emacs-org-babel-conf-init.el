;;; emacs-org-babel-conf-init.el --- bare emacs-org-babel-conf init

;; Copyright (C) 2019 Pierre Penninckx

;; Author: Pierre Penninckx <ibizapeanut@gmail.com>
;; Maintainer: Pierre Penninckx <ibizapeanut@gmail.com>
;; URL: https://github.com/ibizaman/emacs-org-babel-confs

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

;; Bare init file for Makefile's run target.

;;; Code:

(add-to-list 'load-path default-directory)
(mapc #'byte-compile-file '("emacs-org-babel-conf.el"))
(require 'emacs-org-babel-conf)

(org-mode)
(insert ";; Call (org-babel-expand-src-block), bind to C-C C-V v by default,\n"
		";; on the following snippet to see the expanded version:\n"
		"#+begin_src conf :var hello=\"world\"\n"
		"one=1\n"
		"two=$hello\n"
		"#+end_src\n")

(provide 'emacs-org-babel-conf-init)

;;; emacs-org-babel-conf-init.el ends here
