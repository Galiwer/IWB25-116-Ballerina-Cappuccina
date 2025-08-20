# Use the official Ballerina runtime image
FROM ballerina/ballerina:2201.12.8

# Set working directory
WORKDIR /app

# Copy Ballerina configuration files first (for better caching)
COPY Ballerina.toml .
COPY Dependencies.toml* ./

# Copy source files
COPY *.bal ./

# Build the Ballerina application
RUN bal build

# Expose the port that the application will run on
EXPOSE 9090

# Set environment variables
ENV PORT=9090

# Run the application
CMD ["bal", "run"]
