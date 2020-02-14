# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SPHINXINTL    ?= sphinx-intl
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile all en ko clean en_clean ko_clean


# Custom targets

all: en ko

locale:
	@$(SPHINXINTL) update -p "$(BUILDDIR)/gettext" -l en -l ko

en:
	@$(SPHINXBUILD) "$(SOURCEDIR)" "$(BUILDDIR)/html/en" -D language=en $(SPHINXOPTS) $(O)

en_clean:
	@echo "Removing $(BUILDDIR)/html/en"
	@rm -rf "$(BUILDDIR)/html/es_EN"

ko:
	@$(SPHINXBUILD) "$(SOURCEDIR)" "$(BUILDDIR)/html/ko" -D language=kkko) $(O)

ko_clean:
	@echo "Removing $(BUILDDIR)/html/ko"
	@rm -rf "$(BUILDDIR)/html/es_KO"

clean: en_clean ko_clean
