# E-Commerce Sales Data Warehouse (dbt + Snowflake)



#### &nbsp;Project Overview

This project implements an end-to-end data warehouse pipeline using Snowflake and dbt.

The goal is to transform transactional OLTP data into OLAP-ready reporting tables for

business analytics and decision making.



---



#### &nbsp;Architecture



OLTP → Staging → Star Schema → Sales Mart → OLAP Reporting



---



#### &nbsp;Data Layers



##### &nbsp;1. OLTP (RAW)

Transactional source tables:

\- client

\- orders

\- order\_product

\- product

\- payment\_method



---



##### &nbsp;2. Staging Layer (models/01-staging)

Purpose:

\- Clean raw data

\- Standardize column names

\- Prepare data for dimensional modeling



Tables:

\- stg\_client

\- stg\_orders

\- stg\_order\_product

\- stg\_product

\- stg\_payment\_method



---



##### &nbsp;3. Star Schema (models/02-prep)

Kimball methodology applied.



Dimensions:

\- dim\_client (anonymized using dbt macro)

\- dim\_product

\- dim\_payment\_method

\- dim\_time (generated using macro)



Fact Table:

\- fct\_orders



---



##### &nbsp;4. Sales Mart (models/03-marts)

\- mart\_sales

Central analytical table optimized for reporting.



---



##### &nbsp;5. OLAP Reporting Tables

Pre-aggregated tables for fast analytics:

\- RPT\_SALES\_BY\_YEAR

\- RPT\_SALES\_BY\_MONTH

\- RPT\_SALES\_BY\_CATEGORY

\- RPT\_SALES\_BY\_PAYMENT

\- RPT\_SALES\_TREND



---



##### &nbsp;Data Governance

\- Sensitive client data anonymized using dbt macros (MD5 hashing)

\- Clear separation of OLTP and OLAP layers

\- Tested with dbt tests (not\_null, relationships)



---



##### &nbsp;Analytics \& Visualization

\- Time series analysis

\- Product and payment breakdown

\- 2D Heatmap (Year × Month)



---



#### &nbsp;Tools Used

\- Snowflake

\- dbt

\- SQL

\- Python (for visualization)



---



##### &nbsp;



## Models folder structure



models/

│

├── sources.yml              ← RAW (OLTP)

│

├── 01-staging/              ← Clean, rename, standardize

│   ├── stg\_client.sql

│   ├── stg\_client.yml

│   ├── stg\_client\_status.sql

│   ├── stg\_client\_status.yml

│   ├── stg\_client\_type.sql

│   ├── stg\_client\_type.yml

│   ├── stg\_orders.sql

│   ├── stg\_orders.yml

│   ├── stg\_order\_product.sql

│   ├── stg\_order\_product.yml

│   ├── stg\_product.sql

│   ├── stg\_product.yml

│   ├── stg\_payment\_method.sql

│   └── stg\_payment\_method.yml

│

├── 02-prep/                 ← Dimensions + Fact (Star Schema)

│   ├── dim\_client.sql

│   ├── dim\_client.yml

│   ├── dim\_product.sql

│   ├── dim\_product.yml

│   ├── dim\_payment.sql

│   ├── dim\_payment.yml

│   ├── dim\_time.sql

│   ├── dim\_time.yml

│   ├── fct\_orders.sql

│   └── fct\_orders.yml

│

└── 03-marts

&nbsp;   ├── mart\_sales.sql

&nbsp;   ├── mart\_sales.yml

&nbsp;   ├── rpt\_sales\_by\_category.sql

&nbsp;   ├── rpt\_sales\_by\_month.sql

&nbsp;   ├── rpt\_sales\_by\_payment.sql

&nbsp;   ├── rpt\_sales\_by\_year.sql

&nbsp;   ├── rpt\_sales\_trend.sql





##### Outcome

The project demonstrates a complete OLAP reporting pipeline with

governance, scalability, and business insight generation.



