FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV PATH="/root/.local/bin:${PATH}"

# Install system dependencies and pip
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    libpq-dev \
    python-dev \
    && pip install --upgrade pip setuptools wheel

# Install required Python packages
COPY requirements.txt /app/
WORKDIR /app
RUN pip install -r requirements.txt

# Install Kaggle (without build isolation)
RUN pip install kaggle --no-build-isolation

# Copy the Streamlit app
COPY . /app/

# Expose the port Streamlit will run on
EXPOSE 8501

# Start the application
CMD ["streamlit", "run", "app.py", "--server.port", "8501", "--server.address", "0.0.0.0"]
