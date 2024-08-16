# Drsolver docker

This repository provides a Dockerfile for building a Docker image with DrSolver and DrPlotter.

**Current DrPlotter Version: 1.0.3**

To use a different version of DrPlotter, modify the download link in the Dockerfile (line 10):

```dockerfile
# Line 10:
RUN wget -O drplotter.deb "https://github.com/Chia-Network/drplotter/releases/download/1.0.3/drplotter_1.0.3_amd64.deb"


## Running drsolver-docker

This guide provides instructions for cloning the drsolver-docker repository and running the container, assuming Docker is already installed on your system.

**1. Clone the repository:**

```bash
git clone https://github.com/imba-pericia/drsolver-docker.git
```

**2. Navigate to the cloned repository:**

```bash
cd drsolver-docker
```

**3. Build the Docker image:**

```bash
docker build -t drsolver .
```

This command builds a Docker image named `drsolver` using the `Dockerfile` in the current directory (`.`).

**4. Run the Docker container:**

```bash
docker run -it --gpus '"device=0,3,4"' -e DRSERVER_IP_ADDRESS=Your_drserver_ip_address:port drsolver
```

This command runs the `drsolver` image in an interactive terminal (`-it`) and exposes specific GPUs (`--gpus '"device=0,3,4"'`). It also sets an environment variable `DRSERVER_IP_ADDRESS` with the IP address and port of your DRSERVER.  Replace `Your_drserver_ip_address:port` with the actual values.

**Explanation of options:**

* **`-it`:** Runs the container in interactive mode with a pseudo-TTY.
* **`--gpus '"device=0,3,4"'`:** Specifies the GPUs to be used by the container. You can list specific GPU IDs (e.g., `0,1,2`), ranges (e.g., `0-2`), or use `all` for all available GPUs.
* **`-e DRSERVER_IP_ADDRESS=Your_drserver_ip_address:port`:** Sets the environment variable `DRSERVER_IP_ADDRESS` with the IP address and port of your DRSERVER.
* **`--rm` (optional):** Automatically removes the container after it stops. Useful for temporary containers.
* **`--restart=always` (optional):** Automatically restarts the container if it fails or after the host reboots.
* **`--name <container_name>` (optional):** Assigns a specific name to the container.

**Example with additional options:**

```bash
docker run -it --gpus '"device=0"' --rm --restart=always -e DRSERVER_IP_ADDRESS=192.168.1.6:8080 drsolver
```

This example uses GPU with ID 0, automatically removes the container after it stops, and always restarts it. It sets the `DRSERVER_IP_ADDRESS` to `192.168.1.6:8080`.

**Customize the command with the appropriate options for your specific needs.** You can combine and modify these options based on your requirements. Remember to replace placeholders like `Your_drserver_ip_address:port` with actual values.

**Exiting and Re-entering Interactive Mode:**

* **Exiting without stopping the container:** Press `Ctrl+P` followed by `Ctrl+Q` to detach from the container without stopping it.

* **Re-entering the container:** Use the following command to re-attach to the running container:

```bash
docker attach <container_id_or_name>
```

Replace `<container_id_or_name>` with the ID or name of your container. You can find this information using `docker ps`.




## Step-by-Step Docker Installation on Ubuntu:

**1. Update the system:**

```bash
sudo apt update
sudo apt upgrade
```

**2. Remove older versions of Docker (if any):**

```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
```

**3. Install required packages:**

```bash
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

**4. Add the GPG key for the official Docker repository:**

```bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

**5. Add the Docker stable repository:**

```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

**6. Update the package index:**

```bash
sudo apt-get update
```

**7. Install Docker Engine, containerd, and Docker Compose:**

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin nvidia-docker2
```

**8. Verify the Docker installation:**

```bash
sudo docker run hello-world
```

If you see a greeting message from Docker, the installation was successful.

**9. (Optional) Add your user to the docker group to run without sudo:**

```bash
sudo usermod -aG docker $USER
```

**10. Log out and back in (or reboot) to apply the group changes.**

After completing these steps, Docker will be installed and ready to use.
