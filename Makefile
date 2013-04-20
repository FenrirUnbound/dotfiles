BACKUP_DIR := "$(HOME)/.backup_dotfiles"
INSTALL_DIR := "$(HOME)/.dotfiles"
SRC := $(shell find . -type d \( -path ./.git -o -path . \) -prune -o -name ".*" -print)
TIMESTAMP := `date +%Y%m%d%H%M%S`

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

install: SRC = $(shell find `pwd` -path `pwd`/.git -prune -o -name ".*" -print)
install:
	test -d $(INSTALL_DIR) || mkdir $(INSTALL_DIR)
