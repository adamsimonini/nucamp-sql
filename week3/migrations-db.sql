-- there are two types of database migrations: schema and data 


-- schema migrations include creating or deleting a table, column, or constraint
-- modifying the property of a column (e.g., it's name or datatype)
-- renaming a table, column, or constraint
-- changes to the entity-relationship diagram

-- data migrations transform existing data values (into a new format)
-- for exmample, changing the casing of all text fields in a column, or stripping out special characters in a column (e.g., phone numbers)
-- you can also map an existing set of values to a new set of values, thereby changing every record for a given column

-- migrations should be incremental, reversible, and programmatic 
-- each increment represents a new, valid, and working database