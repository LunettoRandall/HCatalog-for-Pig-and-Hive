# Create and Execute Pig Script
# Open Grunt in terminal and adopt HCatalog to share previously created Hive tables with Pig
pig -useHCatalog

# The data is already in HDFS through HCatalog. HCatalog stores schema and location information, so use the HCatLoader() function within the Pig script 
# to read data from HCatalog-managed tables. In Pig, you now only need to give the table a name or alias so that Pig can process the table.

a = LOAD 'rlunett.drivers' using org.apache.hive.hcatalog.pig.HCatLoader();
b = LOAD 'rlunett.truck_events' using org.apache.hive.hcatalog.pig.HCatLoader();

# Join both the tables on driverId
# create a new data set using the Pig Join function that will match the driverid field and include all of the
data from both tables.

c = join b by driverid, a by driverid;

# Execute the script and generate output
# Complete the Join operation - use the DUMP command to execute the results. This will show all of the records that have a common driverid. 
# The data from both tables will be merged into one row.

dump c;

# Output a relation into a new file in HDFS. Output the c relation to a folder named output/c .

STORE c INTO 'output/c' USING PigStorage(',');
