
import pytest

# https://pytest-with-eric.com/pytest-advanced/pytest-fastapi-testing/

def test_api(mock_client):
    response = mock_client.get("/")
    assert response is not None
    assert response.status_code == 200
    assert response.json() == {"name": "python-CICD-sample-fast-api", "version": "1.0.0"}
    
    response = mock_client.get("/test/1")
    assert response is not None
    assert response.status_code == 200
    assert response.json() == {f"message": "Hello World [1]"}