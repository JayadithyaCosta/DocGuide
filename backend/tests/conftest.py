import pytest
import os
from app.core.config import settings

# Set test environment
os.environ["ENV_FILE"] = ".env.test"

@pytest.fixture(scope="session")
def app_settings():
    return settings