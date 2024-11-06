# 4G Capital Challenge

This repository contains the full application and infrastructure for the **4G Capital Challenge**. Each component of the project (infrastructure, backend, frontend, and case study) is stored in its respective directory with detailed instructions provided in their README files.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Prerequisites](#prerequisites)
3. [Folder Structure](#folder-structure)
4. [Deployment](#deployment)
5. [License](#license)

## Project Overview

The **4G Capital Challenge** is a project that involves building both a backend and frontend application along with the necessary infrastructure to deploy and manage the services. The backend is implemented with **Flask** and connected to a **PostgreSQL** database, while the frontend provides a user interface for interacting with the backend.

The project was originally intended to be deployed to **Google Cloud Platform (GCP)** using **Cloud Run** and **Kubernetes Engine (GKE)**. However, due to cost issues with GCP's free-tier services, the deployment was shifted to a **local Kubernetes environment** using **Kubernetes IN Docker (KIND)**. This allows for easy testing and development while simulating a cloud environment locally.

This repository is structured to contain separate folders for each part of the project, making it easier to manage and deploy each component.

## Prerequisites

Before setting up this project, ensure you have the following installed:

- **Docker** (for containerization)
- **Kubernetes** (for deployment)
- **kubectl** (for interacting with your Kubernetes cluster)
- **ArgoCD** (for continuous deployment)
- A **local or cloud-based PostgreSQL** instance (or a Kubernetes-based PostgreSQL setup)
- **KIND** (for local Kubernetes cluster creation if deploying locally)

## Folder Structure

Each directory contains a dedicated README file with detailed instructions specific to that component of the project. Please refer to the respective README files for detailed setup, deployment, and configuration instructions.

- **[4g-capital-infrastructure](./4g-capital-infrastructure/README.md)**: Infrastructure setup and configurations for GCP and Kubernetes deployment.
- **[CaseStudy](./CaseStudy/README.md)**: The case study detailing the architectural design and solutions implemented.
- **[backend](./backend/README.md)**: Backend application setup and deployment instructions for the Flask API, including environment variable configurations and API endpoints.
- **[frontend](./frontend/README.md)**: Frontend setup and deployment instructions, including any configurations for the UI and user interactions with the backend.

## Deployment

Deployment configurations for the project are stored in the respective directories for each component, such as backend, frontend, and infrastructure. The project supports both **local** and **cloud** deployments, and the setup mirrors both environments to ensure consistency.

### Local Deployment with KIND

1. **Containerize the Applications**: The backend and frontend are containerized using Docker. Local deployments use **KIND** to simulate Kubernetes clusters on your local machine.

2. **Provision Local Kubernetes Cluster**: Use **KIND** to create a local Kubernetes cluster. This local setup mirrors the GCP Kubernetes environment, allowing for similar deployment steps locally.

3. **Deploy Applications**: Both the backend and frontend applications can be deployed locally using Kubernetes manifests for KIND.

4. **CI/CD with ArgoCD**: ArgoCD is set up to automate deployments to both **local Kubernetes** clusters and **GCP** Kubernetes Engine. Once changes are pushed to the repository, ArgoCD will automatically deploy updates to the environment.

### GCP Deployment (Previous Plan)

1. **Cloud Resources Provisioned via Terraform**: The infrastructure is provisioned using **Terraform**, which automates the creation of resources on GCP such as **Google Cloud SQL**, **Cloud Run**, and **Google Kubernetes Engine (GKE)**.

2. **Docker Images on GCP**: The backend and frontend Docker images are pushed to **Google Container Registry (GCR)**, which are then deployed to **Cloud Run** or **GKE** for serverless or managed Kubernetes deployments.

3. **Cloud Run Deployment**: The backend service was initially intended to run on **Google Cloud Run** for serverless computing. However, due to resource limitations in the free-tier GCP account, this deployment was later switched to local Kubernetes.

4. **CI/CD with ArgoCD**: ArgoCD is configured to deploy the applications to **GKE** and automatically manage the updates and deployments in the cloud environment.

### Challenges & Adjustments

- **Google Cloud Platform Cost Issues**: Initially, the goal was to deploy the application to **GCP Cloud Run**. However, due to **cost limitations** in the free-tier account, particularly related to resource allocation and scaling, the deployment was shifted to a **local Kubernetes setup** using **KIND** for testing and development.
  
- **Local Kubernetes Setup with KIND**: To simulate a GCP-like environment locally, the Kubernetes cluster was set up with **KIND**, allowing for local testing and deployment. This setup ensures that the application behaves the same way in both environments.

Please refer to the individual README files for more detailed instructions on setting up, deploying, and configuring the project for both local and cloud environments.

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.
