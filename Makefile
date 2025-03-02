prefix ?= /usr/local

sysdir = $(prefix)/share/dosemu2-extras
libexecdir = $(prefix)/libexec

all:

install:
	install -m 0644 -D src/bat/*.bat -t $(DESTDIR)$(sysdir)/bat
	install -m 0644 -D src/bat/dosrc.d/* -t $(DESTDIR)$(sysdir)/bat/dosrc.d
	install -m 0644 -D src/bat/stuffkey/* -t $(DESTDIR)$(sysdir)/bat/stuffkey
	install -m 0644 -D src/*.shh -t $(DESTDIR)$(sysdir)/bat/win31
	install -m 0755 -D src/dosemu-* -t $(DESTDIR)$(libexecdir)/dosemu

rpm: install-win31.spec.rpkg
	git clean -fd
	rpkg local

deb:
	debuild -i -us -uc -b
