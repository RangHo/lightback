NAME=lightback
SVDIR=/etc/sv

all:
	@echo "Nothing to build."

install:
	install -d $(SVDIR)/$(NAME)
	install -m 755 -t $(SVDIR)/$(NAME) run finish conf

uninstall:
	rm -rf $(SVDIR)/$(NAME)

.PHONY: install uninstall
