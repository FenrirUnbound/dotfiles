BACKUP_DIR := "$(HOME)/.backup_dotfiles"
INSTALL_DIR := "$(HOME)/.dotfiles"
SRC := $(shell find . -path ./.git -prune -o -name ".?*" -print)
TIMESTAMP := `date +%Y%m%d%H%M%S`

fun:
	@echo "$(SRC)"

backup:
	test -d $(BACKUP_DIR) || mkdir $(BACKUP_DIR)
	test -d $(BACKUP_DIR)/$(TIMESTAMP) || mkdir $(BACKUP_DIR)/$(TIMESTAMP)
	for me in $(SRC); \
	do \
	  if [ -e "$(HOME)/$${me:2}" ]; \
	  then \
		cp "$(HOME)/$${me:2}" "$(BACKUP_DIR)/$(TIMESTAMP)/"; \
	  fi \
	done

install: backup
	test -d $(INSTALL_DIR) || mkdir $(INSTALL_DIR)
	cp $(SRC) $(INSTALL_DIR)
	for file in $(SRC); \
	do \
	  ln -fs $(INSTALL_DIR)/$${file:2} $(HOME)/$${file:2}; \
	done
