MD_FILES := $(wildcard *.md */*.md)
MD_FILES := $(filter-out README.md, $(MD_FILES))

GEN_HTML_FILES= $(MD_FILES:.md=.html)

PANDOC_FROM= markdown
PANDOC_TO= html5
PANDOC_TEMPLATE= template.html

CSS_FILE=assets/css/style.css
LOGO_FILE=assets/images/logo.png

%.html : %.md $(PANDOC_TEMPLATE) $(CSS_FILE) $(LOGO_FILE)
	@pandoc \
		--from $(PANDOC_FROM) \
		--to $(PANDOC_TO) \
		--template $(PANDOC_TEMPLATE) \
		-V css_timestamp=`date -r $(CSS_FILE) +%s` \
		-V logo_timestamp=`date -r $(LOGO_FILE) +%s` \
		-o $@ \
		$<

.PHONY: gen-pages
gen-pages: $(GEN_HTML_FILES)

.PHONY: all
all: gen-pages

.PHONY: clean
clean:
	- rm $(GEN_HTML_FILES)
