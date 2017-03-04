#!/bin/sh
mkdir -p /app
mount -t tmpfs tmpfs /app
mkdir /app/workdir
mkdir /app/mountpoint
mount -t overlay overlay -o lowerdir=/app_readonly,upperdir=/app/mountpoint,workdir=/app/workdir /app/mountpoint
cd /app/mountpoint
mount --bind /var/db db
mkdir -p db/migrate
mount --bind /app_readonly/db/migrate db/migrate
rake db:migrate
rails server -b 0.0.0.0
