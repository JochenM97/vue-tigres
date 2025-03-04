# Use the node image from official Docker Hub
FROM node:16.10.0-alpine3.13 as build-stage
# set the working directory
WORKDIR /app
# Copy the working directory in the container
COPY package*.json ./
# Install the project dependencies
RUN npm install
# Copy the rest of the project files to the container
COPY . .
# Expose the port 3000
EXPOSE 3000
# Run the command to start the application when the container starts
CMD ["npm", "run", "start"]