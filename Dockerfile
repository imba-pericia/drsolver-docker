FROM nvidia/cuda:12.0.1-runtime-ubuntu22.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    ca-certificates \
    build-essential

# Install DrPlotter
RUN wget -O drplotter.deb "https://github.com/Chia-Network/drplotter/releases/download/1.0.3/drplotter_1.0.3_amd64.deb" 
RUN dpkg -i drplotter.deb

# Clean up apt cache
RUN apt-get clean

# Run DrSolver when the container starts
CMD ["drsolver"]
