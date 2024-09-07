CREATE TABLE "Product" (
  "id" integer PRIMARY KEY,
  "bar_code" integer,
  "name" varchar,
  "category" varchar,
  "rating" integer,
  "created_at" timestamp
);

CREATE TABLE "Ingredient" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "description" varchar
);

CREATE TABLE "ProductIngredient" (
  "id" integer PRIMARY KEY,
  "product_id" integer,
  "ingredient_id" integer
);

ALTER TABLE "ProductIngredient" ADD FOREIGN KEY ("product_id") REFERENCES "Product" ("id");

ALTER TABLE "ProductIngredient" ADD FOREIGN KEY ("ingredient_id") REFERENCES "Ingredient" ("id");
