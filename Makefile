#
# Makefile to build and install SICP.info
#
# 
#

DESTDIR ?= /usr/local/share/info


GZIP     = gzip
INSTALL  = install
MAKEINFO = makeinfo
RM       = rm -rf

MAKEINFO_OPTIONS = --no-split


.PHONY: all clean install uninstall
.INTERMEDIATE: sicp.info


all: sicp.info.gz

clean:
	$(RM) *.info *.gz

install: all
	$(INSTALL) -d $(DESTDIR)
	$(INSTALL) -t $(DESTDIR) --mode=644 sicp.info.gz

uninstall:
	$(RM) $(DESTDIR)/sicp.info.gz

sicp.info.gz: sicp.info
	$(GZIP) $<

sicp.info: sicp.texi
	$(MAKEINFO) $(MAKEINFO_OPTIONS) --output=$@ $<
