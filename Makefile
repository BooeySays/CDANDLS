PREFIX ?= /usr/local
HOMEDIR = ~
DX2DIR = $(DESTDIR)$(HOMEDIR)/.DX2
BINDIR = $(DESTDIR)$(PREFIX)/bin
DX2BIN = $(DESTDIR)$(DX2DIR)/bin
DX2RC = $(DESTDIR)$(DX2DIR)/rc
DX2FN = $(DESTDIR)$(DX2DIR)/functions
DX2TMP = $(DESTDIR)$(DX2DIR)/temp
DX2BK = $(DESTDIR)$(DX2DIR)/backups
DX2GIT = $(DESTDIR)$(DX2DIR)/github
DX2FILES = $(DESTDIR)$(DX2DIR)/files
DX2AKA = $(DESTDIR)$(DX2DIR)/aliases
#MANDIR = $(DESTDIR)$(PREFIX)/share/man/man1
#DOCDIR = $(DESTDIR)$(PREFIX)/share/doc/googler


.PHONY: all prep unprep install uninstall disable-self-upgrade

all:

prep:
	@test -d $(DX2DIR) || install -m755 -d $(DX2DIR)
	@test -d $(DX2BIN) || install -m755 -d $(DX2BIN)
	@test -d $(DX2RC) || install -m755 -d $(DX2RC)
	@test -d $(DX2FN) || install -m755 -d $(DX2FN)
	@test -d $(DX2TMP) || install -m755 -d $(DX2TMP)
	@test -d $(DX2BK) || install -m755 -d $(DX2BK)
	@test -d $(DX2GIT) || install -m755 -d $(DX2GIT)
	@test -d $(DX2FILES) || install -m755 -d $(DX2FILES)
	@test -d $(DX2AKA) || install -m755 -d $(DX2AKA)
	@test -f $(HOMEDIR)/.dx2rc || install -m755 .dx2rc $(HOMEDIR)
	@printf "\nSearching for .bashrc...\t"
	@test -f $(HOMEDIR)/.bashrc && echo "FOUND" && printf "Editing .bashrc:...\t\t" && echo "\n### BEG - SOURCE DX2RC ###\nif [ -f ~/.dx2rc ]; then\n\tsource ~/.dx2rc;\nfi\n### END - SOURCE DX2RC ###\n" >> ~/.bashrc && echo "DONE" || echo "NOT FOUND"
	@printf "\nSearching for .zshrc...\t"
	@test -f $(HOMEDIR)/.zshrc && echo "FOUND" && printf "Editing .zshrc:...\t\t" && echo "\n### BEG - SOURCE DX2RC ###\nif [ -f ~/.dx2rc ]; then\n\tsource ~/.dx2rc;\nfi\n### END - SOURCE DX2RC ###\n" >> ~/.zshrc && echo "DONE" || echo "NOT FOUND"

unprep:
	rm -rf $(DX2DIR)
	rm $(HOMEDIR)/.dx2rc
	sed -i '/### BEG - SOURCE DX2RC ###/,/### END - SOURCE DX2RC ###/d' ~/.bashrc

install:
	test -d $(DX2DIR) || make prep
#	install -m755 -d $(BINDIR)
#	install -m755 -d $(MANDIR)
#	install -m755 -d $(DOCDIR)
#	gzip -c <file>.1 > <file>.1.gz
	install -m755 cdandls.sh $(DX2FN)
#	install -m755 <file>.rc $(DX2RC)
#	install -m644 <file>.1.gz $(MANDIR)
#	install -m644 README.md $(DOCDIR)
#	rm -f <file>.1.gz

uninstall:
	rm -f $(DX2FN)/cdandls.sh
#	rm -f $(DX2RC)/<file>.rc
#	rm -f $(MANDIR)/<file>.1.gz
#	rm -rf $(DOCDIR)

# Disable the self-upgrade mechanism entirely. Intended for packagers.
#
# We assume that sed(1) has the -i option, which is not POSIX but seems common
# enough in modern implementations.
disable-self-upgrade:
	sed -i.bak 's/^ENABLE_SELF_UPGRADE_MECHANISM = True$$/ENABLE_SELF_UPGRADE_MECHANISM = False/' googler
