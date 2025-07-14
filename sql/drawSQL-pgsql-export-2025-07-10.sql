CREATE TABLE "CustomerOrder"(
    "id" BIGINT NOT NULL,
    "status" INTEGER NOT NULL,
    "estimated_delivery_date" BIGINT NOT NULL,
    "payment_method" VARCHAR(255) CHECK
        ("payment_method" IN('')) NOT NULL,
    "organization_id" BIGINT NOT NULL,
    "customer_id" BIGINT NOT NULL,
    "note" TEXT NOT NULL
);
ALTER TABLE
    "CustomerOrder" ADD PRIMARY KEY("id");
COMMENT
ON COLUMN
    "CustomerOrder"."organization_id" IS 'Moart/Convexo';
CREATE TABLE "OrderLine"(
    "id" BIGINT NOT NULL,
    "product_id" BIGINT NOT NULL,
    "quantity" BIGINT NOT NULL,
    "unit_price_cents" BIGINT NOT NULL,
    "unit_price_currency" VARCHAR(3) NOT NULL,
    "customer_order_id" BIGINT NOT NULL
);
ALTER TABLE
    "OrderLine" ADD PRIMARY KEY("id");
CREATE TABLE "OrderValueAdjustment"(
    "id" BIGINT NOT NULL,
    "description" TEXT NOT NULL,
    "value_cents" BIGINT NOT NULL,
    "value_currency" VARCHAR(3) NOT NULL,
    "customer_order_id" BIGINT NOT NULL
);
ALTER TABLE
    "OrderValueAdjustment" ADD PRIMARY KEY("id");
CREATE TABLE "Customer"(
    "id" BIGINT NOT NULL,
    "email" TEXT NOT NULL,
    "person_id" BIGINT NULL,
    "company_id" BIGINT NULL,
    "address_id" BIGINT NOT NULL,
    "phone_number_id" BIGINT NOT NULL
);
ALTER TABLE
    "Customer" ADD PRIMARY KEY("id");
CREATE TABLE "Address"(
    "id" BIGINT NOT NULL,
    "CEP" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "district" TEXT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "complement" TEXT NULL
);
ALTER TABLE
    "Address" ADD PRIMARY KEY("id");
CREATE TABLE "Phone"(
    "id" BIGINT NOT NULL,
    "number" BIGINT NOT NULL
);
ALTER TABLE
    "Phone" ADD PRIMARY KEY("id");
CREATE TABLE "Person"(
    "id" BIGINT NOT NULL,
    "cpf" TEXT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL
);
ALTER TABLE
    "Person" ADD PRIMARY KEY("id");
CREATE TABLE "Company"(
    "id" BIGINT NOT NULL,
    "fantasy_name" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "state_registration" TEXT NOT NULL,
    "city_registration" TEXT NOT NULL,
    "cnpj" TEXT NOT NULL
);
ALTER TABLE
    "Company" ADD PRIMARY KEY("id");
CREATE TABLE "Organization"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "cnpj" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "address_id" BIGINT NOT NULL,
    "phone_number_id" BIGINT NOT NULL
);
ALTER TABLE
    "Organization" ADD PRIMARY KEY("id");
CREATE TABLE "Product"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "default_unit_price_cents" BIGINT NOT NULL,
    "default_unit_price_currency" VARCHAR(3) NOT NULL
);
ALTER TABLE
    "Product" ADD PRIMARY KEY("id");
ALTER TABLE
    "CustomerOrder" ADD CONSTRAINT "customerorder_customer_foreign" FOREIGN KEY("customer_id") REFERENCES "Customer"("id");
ALTER TABLE
    "Customer" ADD CONSTRAINT "customer_phone_number_foreign" FOREIGN KEY("phone_number_id") REFERENCES "Phone"("id");
ALTER TABLE
    "Customer" ADD CONSTRAINT "customer_company_foreign" FOREIGN KEY("company_id") REFERENCES "Company"("id");
ALTER TABLE
    "Customer" ADD CONSTRAINT "customer_person_foreign" FOREIGN KEY("person_id") REFERENCES "Person"("id");
ALTER TABLE
    "Organization" ADD CONSTRAINT "organization_phone_number_foreign" FOREIGN KEY("phone_number_id") REFERENCES "Phone"("id");
ALTER TABLE
    "OrderLine" ADD CONSTRAINT "orderline_customer_order_foreign" FOREIGN KEY("customer_order_id") REFERENCES "CustomerOrder"("id");
ALTER TABLE
    "OrderLine" ADD CONSTRAINT "orderline_product_foreign" FOREIGN KEY("product_id") REFERENCES "Product"("id");
ALTER TABLE
    "Organization" ADD CONSTRAINT "organization_address_foreign" FOREIGN KEY("address_id") REFERENCES "Address"("id");
ALTER TABLE
    "Customer" ADD CONSTRAINT "customer_address_foreign" FOREIGN KEY("address_id") REFERENCES "Address"("id");
ALTER TABLE
    "OrderValueAdjustment" ADD CONSTRAINT "ordervalueadjustment_customer_order_foreign" FOREIGN KEY("customer_order_id") REFERENCES "CustomerOrder"("id");
ALTER TABLE
    "CustomerOrder" ADD CONSTRAINT "customerorder_organization_foreign" FOREIGN KEY("organization_id") REFERENCES "Organization"("id");