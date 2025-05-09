#!/bin/bash

# Create Streamlit configuration
mkdir -p ~/.streamlit/

echo "\
[server]\n\
port = $PORT\n\
enableCORS = false\n\
headless = true\n\
\n\
" > ~/.streamlit/config.toml

# Upgrade essential packages
pip install --upgrade pip setuptools wheel

# Install kaggle with no build isolation to avoid build errors
pip install kaggle --no-build-isolation

# Install other dependencies from requirements
pip install -r requirements.txt
