.PHONY: help setup

help:
	@echo "Available targets:"
	@echo "  setup              - Run Ansible playbook on local machine"
	@echo "  help               - Show this help message"

setup:
	@echo "Running Ansible playbook on local machine..."
	ansible-playbook playbook.yml --ask-become-pass