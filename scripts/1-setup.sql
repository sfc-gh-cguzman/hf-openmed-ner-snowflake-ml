
/* ######################################################### 
ASSIGN INTEGRATION AND COMPUTE POOL PRIVILEGES TO SYSADMIN ROLE
######################################################### */
use role accountadmin;
grant create integration on account to role sysadmin;
grant create compute pool on account to role sysadmin;




/* ######################################################### 
CREATE DATABASE AND SCHEMA
######################################################### */
use role sysadmin;

create or alter database docs_db;
create or alter schema docs_db.main;


/* ######################################################### 
CREATE NETWORK RULE AND EXTERNAL ACCESS INTEGRATION
######################################################### */

use schema docs_db.main;

create network rule if not exists allow_all_network_rules
  mode = egress 
  type = host_port
  value_list = ('0.0.0.0');
;

CREATE EXTERNAL ACCESS INTEGRATION IF NOT EXISTS ALLOW_ALL_EAI 
  ALLOWED_NETWORK_RULES = (allow_all_network_rules)
  ENABLED = true
;



/* ######################################################### 
CREATE COMPUTE POOL
######################################################### */
CREATE COMPUTE POOL IF NOT EXISTS GPU_ML_M_POOL 
  min_nodes = 1
  max_nodes = 10
  instance_family = 'GPU_NV_M'
;

