BACKUP_DIR := "$(HOME)/.backup_dotfiles"
INSTALL_DIR := "$(HOME)/.dotfiles"
SRC := $(shell find . -path ./.git -prune -o -name ".?*" -print)
TIMESTAMP := `date +%Y%m%d%H%M%S`

backup:
	test -d $(BACKUP_DIR) || mkdir $(BACKUP_DIR)
	test -d $(BACKUP_DIR)/$(TIMESTAMP) || mkdir $(BACKUP_DIR)/$(TIMESTAMP)
	for file in $(SRC); \
	do \
	  target=`basename "$${file}"`; \
	  echo "$${target}"; \
	  if [ -e "$(HOME)/$${target}" ]; \
	  then \
		cp "$(HOME)/$${target}" "$(BACKUP_DIR)/$(TIMESTAMP)/"; \
	  fi \
	done

update-dotbot:
	git submodule update --remote dotbot

init-dotbot:
	git submodule update --init dotbot
