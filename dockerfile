FROM python:3.9-alpine

# Set working directory
WORKDIR /app

# Install dependencies
RUN apk update && \
    apk add --no-cache gcc musl-dev linux-headers

# Copy the Django project
COPY . .

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Expose the necessary port
EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
