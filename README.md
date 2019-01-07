# Infrastructure
In this repository you can find all deployments of our and orchestration.

## Background
As TuringML we thrive to take advantage of existing open source projects and
create customisable pipelines for data engineering, data scientist and business
intelligence.

## Repo purpose
This repo should contain a single click deployment with all settings needed for

## Plain instalments
Each subfolder contains a dedicated README with the installation instructions.

### Services with dependencies
- Kubernetes
 - NiFi
   - ZooKeeper
 - Druid
   - ZooKeeper
   - EMR (AWS)
   - MySQL (RDS)
   - S3
 - Kafka
   - ZooKeeper
 - Superset
   - MySQL
 - Redis
 - Vault
 - Grafana / Cadvisor
 - API
 - UI
 - Flink

With these services we thrive to have following functionalities:

#### Collectors (Sources)
A collector allows a user collect data from several sources with many different
types of data.

##### Sources
We would like to support two types of data:
- Event level data
- Relational data

###### Event level data
Following sources are supported for event level data
- Kafka (NiFi)
- Kinesis (NiFi)
- Cloud storage
 - GCS (NiFi)
 - S3 (NiFi)
 - ADL (NiFi)
- FTP (NiFi)

###### Non time-series data
Following sources are supported for event relational data
- HTTP pull (API) (event based)
- HTTP push (NiFi)
- DataBases (RDBMS / JDBC?) (? Druid? Auto updated?)
- MongoDB
- Cloud storage
 - GCS
 - S3
 - ADL
- FTP

// TODO: Check support for all database types with JDBC and Calcite/Avatica etc.

##### Types
We would like to support following types:
- JSON
- AVRO
- CSV
The types only apply on all Cloud Storage / FTP and streaming services.

##### Enrichers
As within the enrichers we support two types of enrichers:

###### Internal enrichers
- We have the IP enrichment of MaxMind, maybe other services are coming later

###### Custom enrichers
- Enrich (http / DB lookup) with non time-series data
HTTP we will depend on ourselves with each event the request needs to enrich the
information. (Most likely not in phase one)

All other datasources connected should store the data in Redis (check with NiFi)
for easy lookup.

##### Joiners
- (no Service for)

##### Operators
- (no Service for)

##### Intelligence
- (no Service for)

##### Storers
- (Druid / NiFi, Cloud Storage, RDBMS, etc...)

### Considerations
- Should we use Helm?
