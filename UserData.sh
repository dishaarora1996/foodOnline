#!/bin/bash
set -e

# Replace {YOUR_GIT_REPO_URL} with your actual Git repository URL
GIT_REPO_URL="https://github.com/dishaarora1996/foodOnline.git"

# If using Private Repo
# GIT_REPO_URL="https://<your_username>:<your_PAT>@github.com/codewithmuh/django-aws-ec2-autoscaling.git"

# Replace {YOUR_PROJECT_MAIN_DIR_NAME} with your actual project directory name
PROJECT_MAIN_DIR_NAME="foodOnline"

# Create the project directory
mkdir -p "/home/ubuntu/project"

# Clone repository into the project directory
git clone "$GIT_REPO_URL" "/home/ubuntu/project/$PROJECT_MAIN_DIR_NAME"

cd "/home/ubuntu/project/$PROJECT_MAIN_DIR_NAME"

# Make all .sh files executable
chmod +x scripts/*.sh

# Execute scripts for OS dependencies, Python dependencies, Gunicorn, Nginx, and starting the application
./scripts/instance_os_dependencies.sh
./scripts/python_dependencies.sh
./scripts/install_database.sh
./scripts/gunicorn.sh
./scripts/nginx.sh
./scripts/start_app.sh
