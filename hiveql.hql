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

# Load the data into the 'truck_events' table

LOAD DATA INPATH '/user/rlunett/tmp/data/truck_event_text_partition.csv' OVERWRITE INTO
TABLE truck_events;

# Create JOIN between drivers and truck_events

select a.driverId,a.driverName,a.eventType,b.certified
from truck_events a join drivers b ON (a.driverId = b.driverId);

















