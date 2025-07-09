# Moart Backoffice

This is the backoffice system's project for Moart, a bulk t-shirt manufacturing and printing company. It's structured as a monorepo, with the frontend living in apps/client and backend in apps/server. There are also E2E tests in apps/e2e.

Monorepo configured with pnpm and NX

## Client

- React SPA with React Router. Vite for bundling e developing. React Query and Zod for data queries and mutations, caching and state management. Material UI as the component library.
- Typescript for intellisense and type checking. Prettier as code formatter and ESlint as linter.
- Folder architecture follows Domain Driven Development, with business logic written inside models, outside components, and is feature scoped, keeping thing closed to where they're used.
- Auth0 for authentication and authorization using Role Based Access Control

## Server

- Ruby on Rails server in API mode.
- Rubocop for linting and styling
- We don't use Kamal for deployment

## E2E

- Playwright
- Chromium tests only

