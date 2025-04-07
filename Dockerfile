# Stage 1: Build the binary.
FROM rust:1.86.0 AS builder

# Install required system dependencies.
RUN apt-get update && apt-get install -y git curl

WORKDIR /app

# Clone the source code.
RUN git clone https://git.vsulimov.com/icao-api.git

# Download airports csv and build the project.
RUN cd icao-api && curl -O https://davidmegginson.github.io/ourairports-data/airports.csv && cargo build --release

# Stage 2: Create a minimal image with Ubuntu
FROM ubuntu:latest

WORKDIR /app

# Copy the compiled binary and airports.csv from the builder stage.
COPY --from=builder /app/icao-api/target/release/icao-api .
COPY --from=builder /app/icao-api/airports.csv .

# Expose the necessary port
EXPOSE 8080

# Run the binary
CMD ["bash", "-c", "./icao-api"]
