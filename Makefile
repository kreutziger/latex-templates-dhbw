#!/bin/sh

TARGET_DIR:=target
OUTPUT_DIR:=output
RESOURCE_DIR:=resources

PDF_PROGRAM:=/usr/bin/xpdf

PROJECT:=$(word 2, $(subst _, ,$(MAKECMDGOALS)))
CONTENTDIR=$(shell pwd)
TEXINPUTS="$(CONTENTDIR):$(TEXINPUTS)"
BIBINPUTS="$(CONTENTDIR):$(BIBINPUTS)"

ifdef PROJECT
$(info )
$(info Working on $(PROJECT))
$(info )
endif

help:
	@echo "############################################"
	@echo "clean-all - clean up all resources"
	@echo "--------------------------------------------"
	@echo "create_%  - bootstrap a new document"
	@echo "display_% - show current build pdf document"
	@echo "full_%    - build whole document"
	@echo "update_%  - update current working resources"
	@echo "############################################"

clean-work:
	@rm -rf -- $(TARGET_DIR)

clean-output:
	@rm -rf -- $(OUTPUT_DIR)

clean-all: clean-output clean-work

create_%:
	-mkdir -p projects/$(PROJECT)
	touch projects/$(PROJECT)/{config,content,main}.tex
	touch projects/$(PROJECT)/literature.bib

display_%:
	$(PDF_PROGRAM) $(OUTPUT_DIR)/$(PROJECT).pdf

full_%: clean-work
	@-mkdir $(TARGET_DIR) 
	@-mkdir $(OUTPUT_DIR) 2> /dev/null
	@cp $(RESOURCE_DIR)/* $(TARGET_DIR)
	@cp projects/$(PROJECT)/* $(TARGET_DIR)
	cd $(TARGET_DIR); texfot xelatex -halt-on-error main
	-bibtex $(TARGET_DIR)/main
	cd $(TARGET_DIR); xelatex main > /dev/null
	cd $(TARGET_DIR); xelatex main > /dev/null
	@mv $(TARGET_DIR)/main.pdf $(OUTPUT_DIR)/$(PROJECT).pdf

update_%:
	cd $(TARGET_DIR); texfot xelatex main
	@mv $(TARGET_DIR)/main.pdf $(OUTPUT_DIR)/$(PROJECT).pdf
