.PHONY: check fmt-fix fmt-check test

MODULE_PATHS := modules/landscape-scalable
ROOT_DIR := $(shell pwd)

fmt-fix:
	for m in $(MODULE_PATHS); do \
		cd $$m && terraform fmt -recursive && \
		tflint --config=$(ROOT_DIR)/.tflint.hcl --init && tflint --config=$(ROOT_DIR)/.tflint.hcl --recursive --fix; \
	done

fmt-check:
	for m in $(MODULE_PATHS); do \
		cd $$m && terraform fmt -check -recursive && \
		tflint --config=$(ROOT_DIR)/.tflint.hcl --init && tflint --config=$(ROOT_DIR)/.tflint.hcl --recursive; \
	done

test:
	for m in $(MODULE_PATHS); do \
		cd $$m && terraform init && terraform test; \
	done
