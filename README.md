# OpenStack Cinder Backup Manager ☁️

A lightweight, GUI-driven automation tool to manage OpenStack block storage backups. Built with Python, Streamlit, and the OpenStack SDK, this application provides an intuitive interface for cloud administrators to execute and manage volume snapshots seamlessly.

## Key Features
* **Automated Discovery:** Instantly identifies volumes currently attached to instances (`in-use`).
* **One-Click Backups:** Creates synchronized snapshots of active volumes without manual CLI intervention.
* **Smart Cleanup Engine:** Automatically purges obsolete backups based on a user-defined retention policy (e.g., older than 3 days), resolving OpenStack timezone discrepancies securely.
* **Fully Containerized:** Easily deployable as a stateless Docker microservice.

## Prerequisites
To run this application, you need:
1. An active OpenStack environment.
2. Your OpenStack credentials file (e.g., `admin-openrc.sh`).
3. **Docker** installed on your local machine or server.

## Quick Start (Docker Deployment)

**1. Prepare your credentials**
Extract your OpenStack environment variables into a `.env` file to securely pass them to the Docker container. Source your OpenStack RC file and extract the variables:
```bash
source admin-openrc.sh
env | grep OS_ > openstack.env

### 2. Build the Docker image
Build the container using the provided `Dockerfile`:

```bash
docker build -t cinder-backup-manager .
```

### 3. Run the application
Launch the container, linking your secure `openstack.env` file and mapping the Streamlit port:

```bash
docker run -p 8501:8501 --env-file openstack.env cinder-backup-manager
```

### 4. Access the GUI
Open your web browser and navigate to: `http://localhost:8501`

## 🛠️ Built With
* **Python 3.12**
* **OpenStack Python SDK**
* **Streamlit**
* **Docker**