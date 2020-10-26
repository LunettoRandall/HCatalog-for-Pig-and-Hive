# Download Dataset 

wget -O driver_data.zip https://raw.githubusercontent.com/hortonworks/datatutorials/
master/tutorials/hdp/beginners-guide-to-apachepig/
assets/driver_data.zip?raw=true

unzip driver_data.zip

# Upload Data into HDFS 

hdfs dfs -mkdir tmp
hdfs dfs -mkdir tmp/data
hdfs dfs -ls tmp

hdfs dfs -put drivers.csv tmp/data/
hdfs dfs -put truck_event_text_partition.csv tmp/data/

