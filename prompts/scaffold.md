# Moart Backoffice Monorepo Scaffold Prompt

Create the folder structure of a monorepo for a backoffice system for Moart, a bulk t-shirt manufacturing and printing company. The monorepo should use `pnpm` for workspace and package management.

## Project Structure
- `apps/client`: Frontend React SPA
- `apps/server`: Backend Ruby on Rails API
- `apps/e2e`: End-to-end tests with Playwright

## Frontend (`apps/client`)
- React SPA using React Router
- Vite for bundling and development. Use Vite's scaffolding to initialize the project.
- React Query and Zod for data fetching, mutations, caching, and validation
- Material UI as the component library
- TypeScript for type checking and intellisense
- Prettier for code formatting, ESLint for linting
- Folder structure follows Domain Driven Design (DDD): business logic in `models`, feature-scoped, logic close to usage
- Auth0 for authentication and authorization (Role Based Access Control)
- Auth0 configuration variables (domain, client ID, etc.) should be read from environment variables
- Use Node.js 23.11.0
- Use `dotenv` for environment variable management

## Backend (`apps/server`)
- Ruby on Rails in API mode
- Use Ruby version 3.2 or newer and Rails version 8.0.0 or newer
- PostgreSQL as the database
- Rubocop for linting and styling
- Use `dotenv` for environment variable management
- Do not use Kamal for deployment

## E2E (`apps/e2e`)
- Playwright for end-to-end tests (Chromium only)

## Shared
- Use a `libs/` folder for any shared code or types between frontend and backend

## CI/CD
- Use GitHub Workflows for CI/CD
- CI should run lint and formatting checks for both frontend and backend, as well as E2E tests
- Deployment process is to be defined

## Additional Notes
- All environment variables should be managed using `.env` files and loaded with `dotenv`
- Use the latest stable versions of all major dependencies
