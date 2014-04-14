FILES = $(wildcard src/*.coffee)

build:
	@$(foreach coffee,$(FILES), coffee -c $(coffee);)
	@spm build

deploy:
	@rm -rf ../../sea-modules/hdl_ant/main
	@mkdir -p ../../sea-modules/hdl_ant/main/0.0.1
	@cp     dist/*.* ../../sea-modules/hdl_ant/main/0.0.1
	@echo
	@echo   " deploy to sea-modules/hdl_ant/main/0.0.1"
	@echo
