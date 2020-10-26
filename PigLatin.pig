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
