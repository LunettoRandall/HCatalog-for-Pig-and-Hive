# Create 'drivers' tables 

create table drivers
(driverId int,
name string,
ssn bigint,
location string,
certified string,
wageplan string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES("skip.header.line.count"="1");

# Load the data into the 'drivers' table

LOAD DATA INPATH '/user/rlunett/tmp/data/drivers.csv' OVERWRITE INTO TABLE drivers;

# Create 'truck_events' table

create table truck_events
(driverId int,
truckId int,
eventTime string,
eventType string,
longitude double,
latitude double,
eventKey string,
correlationId bigint,
driverName string,
routeId int,
routeName string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES("skip.header.line.count"="1");
