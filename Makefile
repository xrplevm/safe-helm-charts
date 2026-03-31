CHARTS_DIR := charts
PACKAGES_DIR := $(CHARTS_DIR)/packages

SUB_CHARTS := safe-client-gateway safe-config-service safe-events-service safe-transaction-service safe-wallet-web

.PHONY: build clean dep-build-sub dep-build-stack

build: dep-build-sub dep-build-stack

dep-build-sub:
	@for chart in $(SUB_CHARTS); do \
		echo "Building dependencies for $$chart..."; \
		helm dependency build $(CHARTS_DIR)/$$chart; \
	done

dep-build-stack: dep-build-sub
	@echo "Building dependencies for safe-stack..."
	@helm dependency build $(CHARTS_DIR)/safe-stack

clean:
	@rm -f $(PACKAGES_DIR)/*.tgz $(PACKAGES_DIR)/index.yaml
