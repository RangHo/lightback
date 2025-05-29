NAME=lightback
DESTDIR=/etc/sv

all:
	@echo "Nothing to build."

install:
	install -d $(DESTDIR)/$(NAME)
	install -m 755 -t $(DESTDIR)/$(NAME) run finish conf

uninstall:
	rm -rf $(DESTDIR)/$(NAME)

.PHONY: install uninstall
