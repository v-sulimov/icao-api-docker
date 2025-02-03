# ICAO API Docker Deployment

This repository provides Docker configurations to deploy [icao-api](https://git.vsulimov.com/icao-api.git/), a Rust-based API for fetching ICAO airport codes.

## Prerequisites

- Docker installed on your system.

## Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://git.vsulimov.com/icao-api-docker.git
cd icao-api-docker
```

## Deployment

Run the following command to build and start the icao-api service:

```bash
docker build -t image_name .
docker run -d -p <host_port>:8080 image_name
```

The service will be accessible at `http://localhost:<host_port>`.