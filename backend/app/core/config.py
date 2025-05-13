import os
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    PROJECT_NAME: str = "DocGenius"
    VERSION: str = "1.0.0"
    API_PREFIX: str = "/api"
    DATABASE_URL: str = "postgresql+asyncpg://user:password@localhost/dbname"
    
    class Config:
        case_sensitive = True
        env_file = os.getenv("ENV_FILE", ".env")

settings = Settings()