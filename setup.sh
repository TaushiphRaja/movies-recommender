#!/bin/bash

# Streamlit configuration
mkdir -p ~/.streamlit/

echo "\
[server]\n\
port = $PORT\n\
enableCORS = false\n\
headless = true\n\
\n\
" > ~/.streamlit/config.toml

# Upgrade pip and install essential build tools first
pip install --upgrade pip setuptools wheel maturin scikit-build cmake

# Install the remaining dependencies
pip install -r requirements.txt
