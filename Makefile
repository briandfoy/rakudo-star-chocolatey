.PHONY: all
all: clean  ## cook the templates
	perl bin/cook_templates

.PHONY: test
test: ## run tests on the package
	prove

.PHONY: push
push: ## push the package to chocolatey
	cd cooked_templates && choco pack && choco push

.PHONY: clean
clean: ## remove the cooked templates
	- del cooked_templates\*.nupkg cooked_templates\*.nuspec
	
