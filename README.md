# Fleet Finder


## Table of Contents
- [Introduction](#introduction)
- [Setup](#setup)
  - [Setting Up the Python Environment](#setting-up-the-python-environment)
  - [Setting Up Pre-Commit Hooks](#setting-up-pre-commit-hooks)

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
