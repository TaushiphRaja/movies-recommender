FROM python:3.9

# Set working directory
WORKDIR /app

# Install system dependencies (if needed)
RUN apt-get update && apt-get install -y gcc libffi-dev

# Copy the current directory contents
COPY . /app/

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Set the entry point to run your app
CMD ["streamlit", "run", "app.py"]
