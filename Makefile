BACKUP_DIR := "$(HOME)/.backup_dotfiles"
INSTALL_DIR := "$(HOME)/.dotfiles"
SRC := $(shell find . -path ./.git -prune -o -name ".?*" -print)
TIMESTAMP := `date +%Y%m%d%H%M%S`

DOTBOT_DIR := dotbot

.PHONY: backup
backup:
	test -d $(BACKUP_DIR) || mkdir $(BACKUP_DIR)
	test -d $(BACKUP_DIR)/$(TIMESTAMP) || mkdir $(BACKUP_DIR)/$(TIMESTAMP)
	for file in $(SRC); \
	do \
	  if [ -e "$(HOME)/$${file:2}" ]; \
	  then \
		cp "$(HOME)/$${file:2}" "$(BACKUP_DIR)/$(TIMESTAMP)/"; \
	  fi \
	done

$(DOTBOT_DIR):
	git submodule add --force https://github.com/anishathalye/dotbot $(DOTBOT_DIR)

.PHONY: update
update: $(DOTBOT_DIR)
	git submodule update --init --remote $(DOTBOT_DIR)
