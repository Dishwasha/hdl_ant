SUBDIRS = $(sort $(dir $(wildcard static/*/)))

build:
	@$(foreach dir,$(SUBDIRS), $(MAKE) -C $(dir) build)

deploy:
	@$(foreach dir,$(SUBDIRS), $(MAKE) -C $(dir) deploy)
