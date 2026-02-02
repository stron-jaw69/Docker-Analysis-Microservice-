# Data-Analysis-Microservice-
Collection xvi

📦A microservice system with FastAPI and Docker for statistical summaries for numeric datasets. It exposes simple REST endpoints to compute count, mean, standard deviation, minimum, maximum, and median values. 

# Objectives 🎯
- **Project base** A containerized API for basic data analysis.
- Provide a clean and fast interface for numerical summary statistics.
- Demonstrate how to build and deploy a FastAPI microservice using **Docker**.
- **Enable easy integration with other services or data pipelines**

# Features 🖌️
- **Health check endpoint (GET /health):**
  Confirms that the service is running and stable.
- **Summary endpoint (POST /summary):**
  Count  -Mean  -Standard deviation  -Min/ Max  -Median
- **Dockerized Deployment:**
  Fully containerized environment for continuous reproducible execution.
# Technical Stack ⚙️
 Technology | Layer
-------|-------------  
**Docker**| Containerization and deployment
**Python**| 3.11	Core runtime environment
**FastAPI**| Web framework for building the API
**Pydantic**| Request validation and data modeling
**Pandas**| Statistical computation
**Uvicorn**| ASGI server for running FastAPI

# Getting Started 📦
- Docker installed
- Python 3.11
### 1. Clone the repository
- git clone <repo-url>
- cd <project-folder>
### 2. Build Docker image
- docker build -t data-analysis-service .
### 3. Run Container
docker run -p 8000:8000 data-analysis-service
### 4. Test API [Health check]
curl http://localhost:8000/health
### 5. Workflow
1. Send a POST request to "/summary" with a JSON body containing a list.
2. DataRequest model validates the request.
3. The service converts the list into a Pandas series
4. Metrics are computed (count, mean, median, standard deviation)
