.PHONY: help build uber run clean

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-12s\033[0m %s\n", $$1, $$2}'

build: ## Build uberjar + self-extracting binary
	clojure -T:build build

uber: ## Build uberjar only
	clojure -T:build uber

run: ## Launch gd-edit (interactive shell)
	./target/gd-edit-standalone

clean: ## Remove build artifacts
	clojure -T:build clean
