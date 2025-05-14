from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_health_check():
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json() == {"status": "ok"}

def test_api_endpoint():
    response = client.get("/api/test")
    assert response.status_code == 200
    assert "message" in response.json()