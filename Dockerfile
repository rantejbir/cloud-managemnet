# Use the official Python 3.9 image based on Debian "Buster" (Debian 10)
FROM python:3.9-buster

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the requirements.txt file from the host to the container's /app directory
COPY requirement.txt .

# Install the Python packages listed in the requirements.txt file using pip
RUN pip3 install --no-cache-dir -r requirement.txt

# Copy all the files and directories from the current directory (host) to the /app directory inside the container
COPY . .

# Set an environment variable to configure Flask to listen on all available interfaces (0.0.0.0)
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port 5000. This does not publish the port to the host, but allows containers to communicate with this port.
EXPOSE 5001

# Set the default command that will be executed when the container starts running.
# In this case, it runs the Flask development server using the "flask run" command.
CMD ["flask", "run"]
