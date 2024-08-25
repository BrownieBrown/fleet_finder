# Variables
APP_NAME := fleet_finder
DOCKER_IMAGE := $(APP_NAME):latest
BUILD_DIR := ./bin
GO_FILES := ./cmd/main.go

# Default target
.PHONY: all
all: build

# Build the Go application
.PHONY: build
build:
	@echo "Building the Go application..."
	@go build -o $(BUILD_DIR)/$(APP_NAME) $(GO_FILES)

# Run the Go application locally
.PHONY: run
run: build
	@echo "Running the Go application locally..."
	@$(BUILD_DIR)/$(APP_NAME)

# Clean up generated files
.PHONY: clean
clean:
	@echo "Cleaning up..."
	@rm -rf $(BUILD_DIR)

# Build the Docker image and load it into Docker
.PHONY: docker-build
docker-build:
	@echo "Building Docker image..."
	@docker buildx build --tag $(DOCKER_IMAGE) --platform linux/arm64 --load .

# Run the Docker container
.PHONY: docker-run
docker-run:
	@echo "Running Docker container..."
	@docker run -d -p 8080:8080 --name $(APP_NAME)_container $(DOCKER_IMAGE)

# View Docker logs
.PHONY: docker-logs
docker-logs:
	@echo "Viewing Docker logs..."
	@docker logs $(APP_NAME)_container

# Stop and remove the Docker container
.PHONY: docker-clean
docker-clean:
	@echo "Stopping and removing Docker container..."
	@docker stop $(APP_NAME)_container || true
	@docker rm $(APP_NAME)_container || true

# Remove Docker image
.PHONY: docker-rmi
docker-rmi:
	@echo "Removing Docker image..."
	@docker rmi $(DOCKER_IMAGE)

# Full cleanup: Go build artifacts, Docker containers, and images
.PHONY: clean-all
clean-all: clean docker-clean docker-rmi
	@echo "Full cleanup done."
