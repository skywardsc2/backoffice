# Order Management Feature Prompt

## Context
- The database schema and models are defined in `./sql/drawSQL-pgsql-export-2025-07-10.sql`.
- Only create the models and migrations necessary for the first feature (order management).

## Feature Requirements
1. **Paginated List of Orders**
    - Implement an API endpoint to return a paginated list of customer orders.
    - Each order in the list should include basic information: id, status, estimated delivery date, customer name, and organization name.
2. **Create New Order**
    - Implement an API endpoint to create a new customer order.
    - The request should accept all required fields for a `CustomerOrder` and related models as needed.
    - Validate input and return errors if invalid.
3. **Order Details**
    - Implement an API endpoint to return the details of a specific order by id.
    - The response should include all order fields and related order lines, value adjustments, customer, and organization info.
4. **Delete Order**
    - Implement an API endpoint to delete a customer order by id.
    - Deleting an order should also delete its associated order lines and value adjustments.

## Implementation Notes
- Use Rails API best practices (serializers, strong params, etc).
- Use pagination (e.g., `kaminari` or `pagy`).
- Only create models and migrations for: `CustomerOrder`, `OrderLine`, `OrderValueAdjustment`, and their minimal required associations (e.g., `Customer`, `Organization`, `Product` if needed for foreign keys).
- Do not scaffold unnecessary models or endpoints.
- **Write all migrations using Rails migration DSL, not raw SQL.**
- **Do not write any tests for this feature.**
- Use environment variables for any sensitive configuration.

---

This prompt is for implementing the first feature: order management, as described above.
