#!/bin/bash

echo "info - Shutting dbox down."
echo "info - Persistant data remains."
docker-compose down
echo "info - Shutdown complete."