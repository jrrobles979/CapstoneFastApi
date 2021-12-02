from fastapi.testclient import TestClient

from main import app

client = TestClient(app)


def test_read_main():
    response = client.get("/api/v1/info")
    assert response.status_code == 200
    assert response.json() == {"version": "1.0.0", "description":"Users api version 1.0.0" , "release_date":"2021-11-30"}