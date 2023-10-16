SHELL:=/bin/bash
# AWS_PROFILE:=$(ENV)

TERRAFORM_BACKEND_FILE:=$(CURDIR)/config/$(ENV)/backend.tfvars
TERRAFORM_BIN:=terraform

terraform/init:
ifndef ENV
	@echo "ENV not defined, try :"
	@echo "	make ENV=qa"
	@echo
	@exit 1
endif
	$(TERRAFORM_BIN) init -input=false -backend-config=$(TERRAFORM_BACKEND_FILE)

terraform/validate: terraform/configure
	$(TERRAFORM_BIN) validate $(CURDIR)

terraform/configure:
ifndef ENV
	@echo "ENV not defined, try :"
	@echo "	make ENV=qa"
	@echo
	@exit 1
endif
ifeq (,$(wildcard $(CURDIR)/config/$(ENV)/config.yml))
	@echo "Invalid environment $(ENV)"
	@echo
	@exit 1
endif
ifeq (,$(wildcard $(CURDIR)/.terraform/terraform.tfstate))
	@echo "Itialization required. Please run :"
	@echo "	make ENV=$(ENV) terraform/init"
	@echo "$(CURDIR)"
	@exit 1
endif
	$(TERRAFORM_BIN) workspace list | grep $(ENV) >/dev/null || $(TERRAFORM_BIN) workspace new $(ENV)
	$(TERRAFORM_BIN) workspace show | grep $(ENV) >/dev/null || $(TERRAFORM_BIN) workspace select $(ENV)

terraform/%: terraform/configure
	$(TERRAFORM_BIN) $(notdir $@) -input=false $(TF_CMD_ARGS)