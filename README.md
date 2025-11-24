Obelion Cloud Automation Assessment - Laravel Backend Repository

This repository demonstrates the automated Continuous Deployment (CD) pipeline for the Laravel PHP Backend application (Task Group B-2).

1. Task Group B-2: Automated Deployment

The deployment pipeline is configured via GitHub Actions (file: .github/workflows/deploy.yml) to automatically push updates to the designated EC2 server whenever a change is merged into the main branch.

Deployment Flow:

Trigger: Push to main branch.

Action: SSH into the Backend EC2 machine.

Execution: Run the deployment script (deploy.sh).

Deployment Script (deploy.sh) Details

The script ensures high availability and correct application state by performing the following steps on the EC2 server (inside the running Docker container):

Pull Changes: git pull origin main (Fetches the new code).

Composer Install: Updates PHP dependencies inside the Docker container.

Database Migration (Task B-2b): Executes php artisan migrate --force to apply any schema changes automatically.

Clear Cache: Clears and re-caches application configurations.

2. Configuration (GitHub Secrets)

To enable the SSH connection from GitHub Actions to the EC2 server, the following repository secrets must be configured:

Secret Name

Description

SSH_HOST

Public IP address of the Backend EC2 instance.

SSH_USER

SSH username (e.g., ubuntu).

SSH_PRIVATE_KEY

The private SSH key used to authenticate with the EC2 server.
