# Infrastructure
In this repository you can find all deployments of our and orchestration.

## Background
As TuringML we thrive to take advantage of existing open source projects and
create customisable pipelines for data engineering, data scientist and business
intelligence.

## Repo purpose
This repo should contain a single click deployment with all settings needed for all applications we need in Turing.

## Usage
In order to run the application, first you need to have the image which allows you to run all commands without dependencies.

Prerequisites:
- [1password](http://1password.com)
- [Docker](https://www.docker.com/)
- [AWS](https://aws.amazon.com/)
- [AWS cli](https://aws.amazon.com/cli/)

1. Clone repository
2. Start your docker environment:
`$ make build` or `$ make pull` will get the container needed in order to run manage the infrastructure.
`$ make run` will run the application. Here it's important to set following environmental variables:
- ONE_PASSWORD_SECRET_KEY
- ONE_PASSWORD_PASSWORD
- ONE_PASSWORD_USER
- CLIENT_ID

NOTE: A token is created by login for 1password and expires after 30 minutes, you can reset the token after expiry by running
`. /etc/profile`

The CLIENT_ID is representative for the name of the client and will be used throughout the whole setup.

Example:
`ONE_PASSWORD_SECRET_KEY=AA-AAAAA-AAAAA-AAAAA-AAAAA-AAAAA-AAAAA ONE_PASSWORD_PASSWORD=password ONE_PASSWORD_USER=some@gmail.com CLIENT_ID=client_name make run`

3. Create / update infrastructure
`$ ansible-playbook playbook.yaml` will spin up the whole infrastructure or updates it accordingly.

4. Delete infrastructure
`$ ansible-playbook playbook.yaml -e state=absent` will remove the whole infrastructure.

## Prerequisites

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
 - Heapster
 - Grafana / Cadvisor
 - Vault
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
