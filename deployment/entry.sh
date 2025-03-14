#!/bin/sh

echo "Starting Prisma migrations..."
npx prisma migrate deploy
echo "Prisma migrations completed."

sh replace-variables.sh &&

nginx &

echo "Starting Supervisor..."
supervisord -c supervisord.conf
