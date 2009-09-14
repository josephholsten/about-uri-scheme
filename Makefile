NAME=draft-holsten-about-uri-scheme
REV=03
LASTREV=02
LAST=$(NAME)-$(LASTREV)
SOURCE=$(NAME)
TARGET=$(NAME)-$(REV)
XML2RFC=tools/xml2rfc.tcl
RFCDIFF=tools/rfcdiff
IDNITS=tools/idnits

default: $(TARGET).html $(TARGET).txt diff nits

edits: $(NAME).html

$(TARGET).html: $(SOURCE).xml $(XML2RFC)
	$(XML2RFC) xml2html $(SOURCE).xml  $(TARGET).html

$(TARGET).txt:  $(SOURCE).xml $(XML2RFC)
	$(XML2RFC) xml2rfc $(SOURCE).xml $(TARGET).txt

$(NAME).html: $(SOURCE).xml $(XML2RFC)
	$(XML2RFC) xml2html $(SOURCE).xml  $(NAME).html

.PHONY: diff
diff:
	$(RFCDIFF) --html $(LAST).txt $(TARGET).txt

.PHONY: nits
nits:
	$(IDNITS) --verbose $(TARGET).txt

