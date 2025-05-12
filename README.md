# DocGenius: AI-Enhanced Document Automation Platform

[![FastAPI](https://img.shields.io/badge/FastAPI-0.101.0-009688.svg?style=flat&logo=fastapi)](https://fastapi.tiangolo.com/)
[![Python](https://img.shields.io/badge/Python-3.11+-3776AB.svg?style=flat&logo=python&logoColor=white)](https://www.python.org/)
[![MongoDB](https://img.shields.io/badge/MongoDB-4.4+-47A248.svg?style=flat&logo=mongodb&logoColor=white)](https://www.mongodb.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14+-336791.svg?style=flat&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![ReactJS](https://img.shields.io/badge/React-18+-61DAFB.svg?style=flat&logo=react&logoColor=black)](https://reactjs.org/)

DocGenius is an AI-powered document automation platform that transforms how small and medium-sized businesses process, extract data from, and automate workflows for their documents.

## ✨ Features

- **Intelligent Document Extraction**: Extract critical data from business documents with high accuracy
- **Template-Based Processing**: Pre-configured templates for common document types
- **Workflow Automation**: Build conditional workflows based on document content
- **Multi-Format Support**: Process PDFs, images, and scanned documents
- **Integration Capabilities**: Connect with your existing business systems

## 🚀 Getting Started

### Prerequisites

- Python 3.11+
- Docker and Docker Compose
- Node.js 18+ (for frontend development)

### Local Development Setup

1. Clone the repository:

```bash
git clone https://github.com/yourusername/docgenius.git
cd docgenius
```

2. Create a virtual environment:

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install backend dependencies:

```bash
cd backend
pip install -r requirements.txt
```

4. Set up environment variables:

```bash
cp .env.example .env
# Edit .env with your configuration
```

5. Start the development environment:

```bash
docker-compose up -d
```

6. Run database migrations:

```bash
alembic upgrade head
```

7. Start the backend server:

```bash
uvicorn app.main:app --reload
```

8. In a new terminal, install and start the frontend:

```bash
cd frontend
npm install
npm run dev
```

### Using Docker for Full Stack Development

```bash
docker-compose -f docker-compose.full.yml up -d
```

## 🏗️ Project Structure

```
docgenius/
├── backend/                 # FastAPI application
│   ├── app/
│   │   ├── api/             # API endpoints
│   │   ├── core/            # Configuration, security, events
│   │   ├── db/              # Database models and session
│   │   ├── services/        # Business logic
│   │   ├── schemas/         # Pydantic models
│   │   └── main.py          # Application entrypoint
│   ├── tests/               # Test suite
│   ├── alembic/             # Database migrations
│   └── requirements.txt     # Python dependencies
├── frontend/                # React frontend
│   ├── src/
│   │   ├── components/      # Reusable UI components
│   │   ├── pages/           # Application pages
│   │   ├── services/        # API integration
│   │   └── App.jsx          # Root component
│   └── package.json         # Node.js dependencies
├── docker-compose.yml       # Development services
└── README.md                # This file
```

## 🔍 Core Components

### Document Processing Engine

The heart of DocGenius is its AI-powered document processing engine that:

- Classifies incoming documents by type
- Extracts structured data using template definitions
- Validates and normalizes extracted information
- Provides confidence scores for extraction accuracy

```python
# Quick example of document processing
from app.services.document_processor import DocumentProcessor

processor = DocumentProcessor()
result = await processor.process_document(
    file=uploaded_file,
    template_id="invoice-standard"
)
```

### Workflow Engine

The workflow engine allows you to:

- Define multi-step document processing workflows
- Create conditional branching based on document content
- Implement approval processes
- Generate notifications based on document data
- Transform and export extracted information

### Template System

The template system provides:

- Pre-configured templates for common document types
- Custom template designer
- Field mapping and extraction rules
- Template versioning

## 📚 API Documentation

When the application is running, API documentation is available at:

- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## 🧪 Running Tests

```bash
cd backend
pytest
```

For test coverage:

```bash
pytest --cov=app
```

## 🔐 Security

DocGenius implements multiple security layers:

- JWT-based authentication
- Role-based access control
- Document encryption at rest
- TLS for all API communications
- Input validation using Pydantic
- Rate limiting and protection against common attacks

## 🚢 Deployment

### Using AWS

```bash
# Example deployment script
aws elasticbeanstalk create-application-version \
    --application-name docgenius \
    --version-label v1.0.0 \
    --source-bundle S3Bucket="deployment-bucket",S3Key="docgenius.zip"
```

### Using Google Cloud

```bash
gcloud app deploy app.yaml
```

## 📝 License

[MIT License](LICENSE)

## 📞 Support

For support, contact [your-email@example.com](mailto:your-email@example.com)

## 🗺️ Roadmap

- Mobile application for document capture
- Advanced analytics dashboard
- Document classification AI
- Blockchain verification option
- Industry-specific template packs
