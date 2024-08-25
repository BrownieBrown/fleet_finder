# Fleet Finder


## Table of Contents
- [Introduction](#introduction)
- [Setup](#setup)
  - [Setting Up the Python Environment](#setting-up-the-python-environment)
  - [Setting Up Pre-Commit Hooks](#setting-up-pre-commit-hooks)
- [Docker Image Build and Deployment](#docker-image-build-and-deployment)
  - [Automated Docker Workflow](#automated-docker-workflow)
  - [Manually Running Docker](#manually-running-docker)
    - [Build the Docker Image](#build-the-docker-image)
    - [Run the Docker Container](#run-the-docker-container)
    - [Access the Application](#access-the-application)
    - [Docker Image Tags](#docker-image-tags)
    - [Running the Docker Image](#running-the-docker-image)

## Introduction
Fleet Finder is a command-line tool designed to track parcels across multiple delivery services. Initially supporting DHL, this tool allows you to easily keep tabs on your shipments, with plans to expand to other services like FedEx, UPS, and even Uber if available. Fleet Finder is designed with flexibility and ease of use in mind, making it the perfect tool for developers and power users alike.

## Setup

### Setting Up the Python Environment

To set up the Python environment for this project, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/BrownieBrown/fleet_finder.git
   cd fleet_finder
   ```

2. **Create a virtual environment:**
   ```bash
   python3 -m venv env

3. **Activate the virtual environment:**
    - on MacOS/Linux:
   ```bash
   source env/bin/activate
   ```
    - on Windows:
   ```bash
    .\env\Scripts\activate
    ```

4. **Install the required packages:**
   ```bash
   pip install -r requirements.txt
   ```

### Setting Up Pre-Commit Hooks

1. **Install pre-commit hooks:**
   ```bash
   pre-commit install
   ```

2. **Deactivate the virtual environment when done:**
   ```bash
   deactivate
   ```
## Docker Image Build and Deployment
This project is configured to automatically build and push Docker images to both Docker Hub and GitHub Container Registry (GHCR) whenever changes are pushed to the `main` branch or any branch matching `release/*`.

### Automated Docker Workflow

Our CI/CD pipeline is set up to:

1. **Build the Docker Image**: The Docker image is built using Docker Buildx, which supports multi-platform builds and advanced caching.
2. **Push to Docker Hub**: The image is pushed to Docker Hub under the repository `docker.io/browniebrown/fleet_finder`.
3. **Push to GitHub Container Registry**: The image is also pushed to GitHub Container Registry (GHCR) under `ghcr.io/BrownieBrown/fleet_finder`.

### Manually Running Docker

If you want to manually build and run the Docker image:

#### Build the Docker Image

```bash
docker build -t fleet_finder:latest .
```

#### Run the Docker Container

```bash
docker run -d -p 8080:8080 --name fleet_finder_container fleet_finder:latest
```

#### Access the Application
You can access the application by navigating to `http://localhost:8080` in your web browser.

#### Docker Image Tags
- `latest`: The latest version of the Docker image.
- `v1.0.0`: A specific version of the Docker image.

```bash
docker build -t fleet_finder:<custom-tag> .
```

#### Running the Docker Image

```bash
docker run -d -p 8080:8080 <your-dockerhub-username>/fleet_finder:latest
```
