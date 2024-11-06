# Project Overview
Welcome to the 4G Capital Backend Project! This project encompasses the development and deployment of a Frontend Application and a Backend Application using Google Cloud Platform (GCP). My main goals include leveraging cloud services, ensuring a seamless CI/CD pipeline, and providing a robust infrastructure.

# Applications
   # Backend Application
Framework: Developed with Flask, providing a lightweight API.
Key Features:
Health check endpoint (/) to verify the service is alive.
Message handling API (/api/msg/<string:msg>) for posting and retrieving messages.
Integration with a PostgreSQL database for storing messages.

  # Frontend Application
Designed to interact with the backend API and offer a user-friendly interface.

# Infrastructure Setup
Cloud SQL Database:

Provisioned a PostgreSQL instance using Terraform to manage backend data.

# Cloud Deploy:
Created deployment targets for both the frontend and backend to streamline CI/CD processes.

# Deployment Strategy
   # Terraform:
Utilized Terraform to provision infrastructure as code, ensuring consistent and repeatable deployments.

   # Docker:
Containerized both applications for deployment on Google Cloud Run, taking advantage of serverless architecture.

   # CI/CD Pipeline:
Set up a CI/CD pipeline using Google Cloud Deploy to automate the deployment process, ensuring continuous integration and delivery.

# Configuration Management
Developed YAML configurations for defining services and job specifications in Cloud Run.

# Instructions for Reproduction
 - Set up your GCP account and configure the necessary services.
 - Clone the repository and install dependencies for both applications.
 - Use Terraform to provision the required infrastructure.
 - Build and deploy the applications using Docker and Cloud Run.

# Conclusion
This project is a testament to my ability to integrate cloud solutions effectively while following modern development practices. All configurations are stored in the 4g-capital-infrastructure folder. I faced challenges regarding cost management, as I created a free tier, as shown in the screenshot.