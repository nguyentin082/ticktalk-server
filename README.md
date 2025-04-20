# TickTalk Server Documentation

## Project Overview

TickTalk is a backend server built with FastAPI, designed to manage conversations, topics, users, and vocabularies. The project follows a clean architecture pattern for scalability and maintainability.

## Project Structure

```
requirements.txt          # Python dependencies for the project
src/                      # Source code directory
    __init__.py           # Marks the directory as a Python package
    api.py                # Registers all API routes
    exceptions.py         # Custom exception classes for error handling
    logging.py            # Logging configuration for the application
    main.py               # Entry point of the application
    rate_limiter.py       # Rate limiting configuration using SlowAPI
    auth/                 # Authentication module
        __init__.py       # Marks the directory as a Python package
        controller.py     # API routes for authentication (e.g., login, register)
        models.py         # Pydantic models for authentication requests and responses
        service.py        # Business logic for authentication (e.g., token generation)
    database/             # Database configuration and utilities
        core.py           # Database connection, session management, and base model
    entities/             # Database entity models
        __init__.py       # Marks the directory as a Python package
        todo.py           # SQLAlchemy model for the Todo entity
        user.py           # SQLAlchemy model for the User entity
    todos/                # Todo module
        __init__.py       # Marks the directory as a Python package
        controller.py     # API routes for managing todos
        models.py         # Pydantic models for todo requests and responses
        service.py        # Business logic for todo operations
    users/                # User module
        __init__.py       # Marks the directory as a Python package
        controller.py     # API routes for user-related operations
        models.py         # Pydantic models for user requests and responses
        service.py        # Business logic for user operations

# Tests
```

## Tests

```
tests/                    # Test cases for the application
    __init__.py           # Marks the directory as a Python package
    conftest.py           # Pytest fixtures for setting up test environments
    test_auth_service.py  # Unit tests for the authentication service
    test_todos_service.py # Unit tests for the todo service
    test_users_service.py # Unit tests for the user service
    e2e/                  # End-to-end tests for API endpoints
        test_auth_endpoints.py  # E2E tests for authentication endpoints
        test_todos_endpoints.py # E2E tests for todo endpoints
        test_users_endpoints.py # E2E tests for user endpoints
```

## Key Features

-   **Modular Design**: Each feature is encapsulated in its own module (e.g., `auth`, `todos`, `users`).
-   **Database Layer**: Centralized database configuration and entity models.
-   **API Layer**: Organized routes for handling different resources.
-   **Validation**: Pydantic models for request and response validation.
-   **Rate Limiting**: Configured using SlowAPI to prevent abuse.

## Setup Instructions

1. Clone the repository.
2. Install dependencies using `pip install -r requirements.txt`.
3. Configure environment variables in the `.env` file.
4. Run the application using `uvicorn src.main:app --reload`.

## Future Improvements

-   Add more test cases to improve coverage.
-   Enhance documentation for API endpoints.
-   Implement additional features as needed.
