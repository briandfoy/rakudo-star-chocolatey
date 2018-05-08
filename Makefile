all:
	perl bin/cook_templates

test:
	prove

push:
	cd cooked_templates && choco pack && choco push
