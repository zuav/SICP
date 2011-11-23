#
# Makefile to build and install SICP.info
#
# 
#

install_dir = /usr/local/share/info


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
	$(INSTALL) -d $(install_dir)
	$(INSTALL) -t $(install_dir) --mode=644 sicp.info.gz

uninstall:
	$(RM) $(install_dir)/sicp.info.gz

sicp.info.gz: sicp.info
	$(GZIP) $<

sicp.info: sicp.texi
	$(MAKEINFO) $(MAKEINFO_OPTIONS) --output=$@ $<
