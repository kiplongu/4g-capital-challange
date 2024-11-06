# 4G Capital Challenge - Frontend

This repository contains the frontend application for the 4G Capital Challenge. The application has been containerized and deployed to Kubernetes using ArgoCD.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
4. [Deployment](#deployment)
5. [Environment Variables](#environment-variables)
6. [UI Screenshots](#ui-screenshots)
7. [License](#license)

## Project Overview

The frontend application is built using React. It provides the user interface to interact with the backend API. The frontend connects to the backend to send and receive messages and displays them in a user-friendly manner. The frontend is containerized using Docker and deployed to Kubernetes using ArgoCD for continuous deployment.

## Prerequisites

Before setting up this project, ensure you have the following installed:

- Node.js (for running the frontend application)
- Docker (for containerization)
- Kubernetes (for deployment)
- `kubectl` (for interacting with your Kubernetes cluster)
- ArgoCD (for continuous deployment)

## Installation

To set up the project locally, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/kiplongu/4g-capital-challange.git
   cd 4g-capital-challange
   cd 4g-capital-challange-frontend


# Install dependencies: If you have npm installed, you can run:

npm install
Run the frontend locally: To start the frontend development server locally, run:

npm start

The application will be available at http://localhost:3000.


# Deployment
I have containerized the frontend application and deployed it to Kubernetes using ArgoCD. The deployment configurations are stored in the deployment/ directory.

# ArgoCD Integration
ArgoCD is used to automate the continuous deployment of the application. Once the repository is updated, ArgoCD handles the process of deploying the changes to the Kubernetes cluster.

# Environment Variables
The frontend application relies on the following environment variables for configuration:

REACT_APP_API_URL: The base URL of the backend API.


Example:
export REACT_APP_API_URL=http://flask-service:5000/api

# UI Screenshots
The UI of the frontend is designed to interact with the backend API, allowing users to view and create messages. Screenshots of the UI can be found in the images/ directory.

# License
This project is licensed under the MIT License - see the LICENSE file for details.
