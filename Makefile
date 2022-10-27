develop: ## Run in development mode
	hugo serve -D

build: ## Build the site
	hugo -t learn -d public --gc --minify --cleanDestinationDir