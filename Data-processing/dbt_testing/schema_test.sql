-- schema_test.sql
select count(*)
from {{ ref('model_1') }}
where column_name is null

