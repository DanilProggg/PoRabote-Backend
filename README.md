# PoRabote — Backend

REST API for **PoRabote** ("For Work"), a job-board app connecting job seekers and employers through vacancies and resumes. This repo is the backend service; the companion [PoRabote Frontend](https://github.com/DanilProggg/PoRabote-Frontend) repo provides the Angular web UI.

## What it does

- **Vacancies** — post, browse (paginated, filterable by keyword/salary/city/experience via a shared `Filter` DTO), edit and delete your own postings; view a single vacancy by id.
- **Resumes** — create, browse (same filter/pagination model, filterable by age/city/experience), edit and delete your own resumes; view a single resume by id.
- **Favorites** — bookmark/unbookmark vacancies or resumes and check bookmark status per item.
- **Responses** — "apply" to a vacancy or respond to a resume, with a status endpoint to check whether the current user has already responded.
- **Users** — registration, fetch/update the current user's profile info, and batch-fetch user profiles by id (used to resolve who responded to a posting).

## Tech stack

- Java, Spring Boot
- Spring Security + JWT (`jjwt`) for stateless authentication
- Spring Data JPA + PostgreSQL
- Maven

## Running locally

The source repo ships without a Dockerfile. A minimal multi-stage `Dockerfile` (Maven build → JRE runtime) and a `docker-compose.yml` are provided, wiring the API to a Postgres instance matching the dev defaults in `application.properties` (`forwork` / `postgres` / `danil`):

```bash
docker compose up --build
```

The API starts on `:8080`, backed by Postgres on `:5432`.
