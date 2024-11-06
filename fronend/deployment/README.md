## Deployment

This project was initially designed to be deployed on **Google Cloud Platform (GCP)**, utilizing services like **Cloud Run** for containerized application deployment. However, due to issues with cost limitations in the free-tier account, particularly around Cloud Run resource allocation and scaling, the decision was made to shift the deployment to a **local Kubernetes environment** using **Kubernetes IN Docker (KIND)**. 

The infrastructure and deployment tools have been set up to mirror the cloud environment, allowing for flexibility in deployment. The setup and deployment process is now designed to work both **locally (using KIND)** and **on GCP**, ensuring the project can be easily deployed to either environment with minimal changes.

### Steps to Deploy Locally and on GCP

1. **Provision Infrastructure**:
   - **On GCP**: Use Terraform to provision resources on GCP, such as Cloud SQL, Cloud Run, and Kubernetes Engine (GKE). Refer to the `4g-capital-infrastructure` folder for the configuration files.
   - **Locally (Using KIND)**: Provision local Kubernetes clusters with KIND, which simulates the GCP environment locally. The infrastructure setup is largely the same, with the only differences being the target environment (cloud vs local).

2. **Containerize Applications**: Both the backend and frontend applications are containerized using Docker, and the deployment configurations for both GCP and KIND are stored in the respective directories. Docker images are pushed to a registry (GCR for GCP, local for KIND).

3. **Deploy Backend and Frontend Applications**:
   - **On GCP**: The application is deployed to **Cloud Run** for serverless compute or **Google Kubernetes Engine (GKE)** for managed Kubernetes, using the deployment YAML files in the `4g-capital-infrastructure` folder.
   - **Locally**: Deploy the backend and frontend applications to the local Kubernetes cluster created with KIND. The deployment YAML files are similar to the GCP setup but configured to run locally with KIND.

4. **CI/CD Integration**:
   - Both the GCP and local deployments are integrated with **CI/CD pipelines** using **ArgoCD**. ArgoCD is configured to monitor the repository for changes and automatically deploy updates to the Kubernetes cluster, whether it's running on GCP or locally.
   - The CI/CD pipelines are configured to handle both environments seamlessly, with minimal changes to the configuration files.

5. **Monitor and Scale**:
   - **On GCP**: Cloud Run automatically scales based on traffic, while GKE uses Kubernetes' native autoscaling.
   - **Locally**: Kubernetes handles scaling and load balancing locally using KIND.

By following these steps, the application can be deployed both locally and on GCP, ensuring flexibility and ease of testing and development in both environments.

## Challenges & Adjustments

- **Google Cloud Platform Cost Issues**: Initially, the goal was to deploy the application to **GCP Cloud Run**, but due to issues with **cost limitations** in the free-tier account (especially around resource allocation and scaling), we pivoted to deploying the application locally.
  
- **Local Kubernetes Setup**: The infrastructure and deployment tools were adapted to use **KIND** for simulating Kubernetes clusters locally, enabling testing and deployment without relying on cloud services. The setup closely mirrors the GCP configuration, ensuring consistency across both environments.

Despite these challenges, the application is fully containerized using **Docker** and runs seamlessly in both Kubernetes environments—whether it's a cloud-based cluster or a local KIND setup.

