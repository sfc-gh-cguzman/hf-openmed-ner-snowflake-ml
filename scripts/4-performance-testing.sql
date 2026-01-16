
/* ######################################################### 
PERFORMANCE TESTING
######################################################### */

use schema docs_db.main;


select count(*) 
from synth_disease_notes;

--Small test: 10 rows
with cte as (
  select text as "inputs"
  from synth_disease_notes
  limit 10
) select docs_db.main.NER_OPEN_MED_SVC10!__CALL__("inputs") AS classification_output
from cte
;

--50,000 rows: 1m45s
with cte as (
  select text as "inputs"
  from synth_disease_notes
  limit 50000
) select docs_db.main.NER_OPEN_MED_SVC10!__CALL__("inputs") AS classification_output
from cte
;


--100,000 rows: 3m54s
with cte as (
  select text as "inputs"
  from synth_disease_notes
  limit 50000
) select docs_db.main.NER_OPEN_MED_SVC10!__CALL__("inputs") AS classification_output
from cte
;