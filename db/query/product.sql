-- name: CreateProduct :one
INSERT INTO "Product"(
    bar_code,
    name,
    category,
    rating

)
VALUES(
     $1, 
     $2,   
     $3,  
     $4    
)
RETURNING *;

-- name: GetProduct :one

SELECT * FROM "Product"
WHERE id=$1 LIMIT 1;

-- name: ListProducts :many

SELECT * FROM "Product"
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateProduct :one

UPDATE "Product"
SET rating = $2
WHERE id =$1
RETURNING *;

-- name: DeleteProduct :exec

DELETE FROM "Product" WHERE id=$1;
