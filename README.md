##Fullstack Web App with Nginx, Python, and MongoDB
<img width="870" height="743" alt="Screenshot 2025-08-09 144230" src="https://github.com/user-attachments/assets/eaca4ee9-dfd7-49aa-8b86-866b02311d26" />
<img width="800" height="555" alt="Screenshot 2025-08-09 144247" src="https://github.com/user-attachments/assets/f0c03054-ae8a-4b88-8c37-1dc3c6397647" />

#Overview
This is a fullstack web application with:
Frontend (HTML, CSS, JS)
Backend built with Python
MongoDB as the database
Nginx as a reverse proxy

The project supports three environments:
Development
Testing
Production
It is fully containerized with Docker and uses GitHub Actions CI/CD to:
Build containers automatically on every push

#Features
Frontend + Backend + Database in one setup
Nginx reverse proxy configuration
Environment-based configuration (dev, test, prod)
MongoDB integration
Docker Compose for multi-container orchestration
CI/CD pipeline for automatic builds and deployment
Testing environment with pytest

#CI/CD Pipeline
This project has a GitHub Actions workflow that:
Builds Docker images on every push to the repository
Pushes the image to Docker Hub
Supports multi-environment deployments

