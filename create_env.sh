#!/bin/bash

# create .env file
echo "UID_GID=$(id -u):$(id -g)" > .env
echo "GID=$(id -g $USER)" >> .env
echo "USERNAME=$USER" >> .env