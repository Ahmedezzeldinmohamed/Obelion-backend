#!/bin/bash

# a- Pull the new changes
echo "Pulling latest changes from Git..."
git pull origin 12.x

# 1. Stop and remove old containers
echo "Stopping and removing old containers..."
sudo docker-compose down || true

# 2. Build & Start containers
echo "Building and starting Docker containers..."
sudo docker-compose up -d --build

# 3. Install composer deps
echo "Installing Composer Dependencies..."
sudo docker exec laravel_app composer install --no-interaction --prefer-dist --optimize-autoloader

# 4. Cache config & routes
echo "Caching configuration and routes..."
sudo docker exec laravel_app php artisan config:cache
sudo docker exec laravel_app php artisan route:cache

# 5. Run migrations
echo "Running Migrations..."
sudo docker exec laravel_app php artisan migrate --force

echo "Deployment Script Finished Successfully!"
