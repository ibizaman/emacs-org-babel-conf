emacs ?= emacs
# EMACS = emacs-24.3

LOAD = -l emacs-org-babel-conf.el -l emacs-org-babel-conf-test.el

.PHONY: all test clean checkdoc

all: compile test checkdoc

test:
	$(emacs) -batch $(LOAD) -f ert-run-tests-batch-and-exit

checkdoc:
	$(emacs) -batch -l targets/checkdoc.el

compile:
	$(emacs) -batch -l targets/emacs-org-babel-conf-init.el

run:
	$(emacs) -Q -l targets/emacs-org-babel-conf-init.el

clean:
	rm -f *.elc
