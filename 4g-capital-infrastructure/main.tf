provider "google" {
  project = "4g-capital-backend"
  region  = "us-central1"
}

# Cloud SQL Database Configuration for Backend
resource "google_sql_database_instance" "backend_db" {
  name             = "backend-database"
  database_version = "POSTGRES_14"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      authorized_networks {
        name  = "Allow Public Access"
        value = "0.0.0.0/0"  # Adjust for security
      }
      ipv4_enabled = true
    }
  }
}

resource "google_sql_user" "backend_db_user" {
  name     = "backend_user"
  instance = google_sql_database_instance.backend_db.name
  password = "4gcapitalpaswword"  # Ensure this is securely managed
}

resource "google_sql_database" "backend_db_database" {
  name     = "backend_db"
  instance = google_sql_database_instance.backend_db.name
}

# Cloud Deploy Configuration for Targets
resource "google_clouddeploy_target" "backend" {
  location = "us-central1"  # Make sure this matches your database location
  name     = "backend-target"

  deploy_parameters = {
    app: "backend"
  }

  description = "Target for the backend service"

  run {
    location = "projects/4g-capital-backend/locations/us-central1"
  }

  project          = "4g-capital-backend"
  require_approval = true  # Approval is required for deployment

  annotations = {
    backend_target_annotation = "Annotation for backend target"
    deployment_strategy = "Canary"  # Example of a deployment strategy
  }

  labels = {
    project_name = "4g-capital"
    application  = "backend"
    environment  = "production"  # or "staging" as needed
    team         = "devops"
  }
}

resource "google_clouddeploy_target" "frontend" {
  location = "us-central1"  # Ensure this matches your frontend service location
  name     = "frontend-target"

  deploy_parameters = {
    app: "frontend"
  }

  description = "Target for the frontend service"

  run {
    location = "projects/4g-capital-backend/locations/us-central1"
  }

  project          = "4g-capital-backend"
  require_approval = true  # Approval is required for deployment

  annotations = {
    frontend_target_annotation = "Annotation for frontend target"
    deployment_strategy = "Blue-Green"  # Example of a deployment strategy
  }

  labels = {
    project_name = "4g-capital"
    application  = "frontend"
    environment  = "production"  # or "staging" as needed
    team         = "devops"
  }
}

# Cloud Deploy Pipeline Configuration
resource "google_clouddeploy_delivery_pipeline" "primary" {
  location    = "us-central1"
  name        = "pipeline"
  description = "Delivery pipeline for backend and frontend applications"
  project     = "4g-capital-backend"

  serial_pipeline {
    stages {
      deploy_parameters {
        values = {
          deployParameterKey = "deployParameterValue"
        }

        match_target_labels = {}
      }

      profiles  = ["backend-profile"]
      target_id = google_clouddeploy_target.backend.name
    }

    stages {
      profiles  = ["frontend-profile"]
      target_id = google_clouddeploy_target.frontend.name
    }
  }

  annotations = {
    pipeline_annotation = "Pipeline for 4g-capital applications"
    managed_by = "terraform"
  }

  labels = {
    project_name = "4g-capital"
    managed_by   = "terraform"
    team         = "devops"
  }

  provider = google-beta
}
