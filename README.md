# User Authentication API

Basic backend API for user registration, authentication, and user management built with NestJS, PostgreSQL and Prisma ORM.

## Features

- User registration
- User authentication with JWT
- Get list of registered users (protected endpoint)
- API Documentation with Swagger
- Docker support

## Tech Stack

- NestJS - Node.js framework
- PostgreSQL - Database
- Prisma ORM - Database ORM
- JWT - Authentication
- bcrypt - Password hashing
- Swagger - API documentation
- Docker & Docker Compose - Containerization
- Jest - Testing

## Prerequisites

To run this project locally, you need to have the following installed:

- Node.js (v18+)
- Yarn
- PostgreSQL
- Docker & Docker Compose (optional)

## Installation & Setup

### Local Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/kokunyan/nestjs-api-kit.git
   cd nestjs-api-kit
   ```

2. Install dependencies:

   ```bash
   yarn install
   ```

3. Set up environment variables by creating a `.env` file in the root directory (don't forget to change **username** and **password** for database and **secret** for authentication):

   ```
   DATABASE_URL="postgresql://postgres:password@127.0.0.1:5432/user_auth_db?schema=public"
   JWT_SECRET="your-jwt-secret-key"
   ```

4. Create the database and run migrations:

   ```bash
   npx prisma migrate dev --name init
   ```

5. Generate Prisma client:

   ```bash
   npx prisma generate
   ```

6. Start the application:
   ```bash
   yarn start:dev
   ```

### Docker Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/kokunyan/nestjs-api-kit.git
   cd nestjs-api-kit
   ```

2. Change environment variables in docker-compose.yml to your own for safety reasons

3. Start the containers:
   ```bash
   docker-compose up -d
   ```

This will start both the PostgreSQL database and the NestJS application.

## API Documentation

Once the application is running, you can access the Swagger documentation at:

```
http://127.0.0.1:3000/api
```

Here you can explore and test all available endpoints.

### Available Endpoints

- `POST /register` - Register a new user
- `POST /login` - Login and receive JWT token
- `GET /users` - Get list of all users (requires authentication)

## Running Tests

```bash
# Unit tests
yarn test

# e2e tests
yarn test:e2e

# Test coverage
yarn test:cov
```

## Development

For local development:

```bash
# Run in development mode with hot-reload
yarn start:dev

# Format code
yarn format

# Lint code
yarn lint
```
