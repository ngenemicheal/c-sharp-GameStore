# GameStore API

A small ASP.NET Core Minimal API project built for learning purposes.

## Overview

This project demonstrates:

- ASP.NET Core Minimal APIs
- Entity Framework Core
- SQLite
- Automatic EF Core migrations on startup
- Seeded reference data
- Docker and Docker Compose support

## Project Structure

- `GameStore.slnx` contains the solution
- `GameStore.Api/` contains the web API project
- `GameStore.Api/Endpoints/` defines the HTTP endpoints
- `GameStore.Api/Dtos/` contains API request/response contracts
- `GameStore.Api/Models/` contains EF Core entities
- `GameStore.Api/Data/` contains the `DbContext`, migrations, and seeding logic

## API Endpoints

- `GET /games`
- `GET /games/{id}`
- `POST /games`
- `PUT /games/{id}`
- `DELETE /games/{id}`
- `GET /genres`

## Run Locally

From the API project folder:

```bash
cd GameStore.Api
dotnet restore
dotnet run
```

The app runs on `http://localhost:5014` in the development profile.

## Test Requests

Example requests are provided in `GameStore.Api/games.http`.

You can also use:

```bash
curl http://localhost:5014/genres
curl http://localhost:5014/games
```

## Push To GitHub

From the repository root:

```bash
git init
git add .
git commit -m "Initial commit: GameStore API"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/GameStore.git
git push -u origin main
```

## Docker Build

From the repository root:

```bash
docker build -t gamestore-api .
```

## Docker Run

```bash
docker run --rm -p 8080:8080 --name gamestore-api gamestore-api
```

Test the running container:

```bash
curl http://localhost:8080/genres
curl http://localhost:8080/games
```

## Docker Compose

Start the app:

```bash
docker compose up --build
```

Stop it:

```bash
docker compose down
```

## Persistence

The Docker Compose setup stores the SQLite database in a Docker volume and overrides the connection string to:

`Data Source=/data/GameStore.db`

This allows the database to persist across container restarts.

## Notes

- This is a learning project, so startup migrations are enabled for convenience.
- Seed data inserts default genres when the database is empty.
- SQLite is simple and good for learning, but production systems often use PostgreSQL or SQL Server.