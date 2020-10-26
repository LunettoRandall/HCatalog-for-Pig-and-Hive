# Confirm files are present

hdfs dfs -ls output
hdfs dfs -ls output/c

# OPEN IN SEPARATE TERMINAL (Bash) to see the content of the output file:
  
  hdfs dfs -cat output/c/part-v002-o000-r-00000 | tail -n 2
  #OR
  hdfs dfs -cat output/c/part-r-00000 | tail -n 2
  
# Download the output file “part-r-00000” to “truck_event.csv”

hdfs dfs -get output/c/part-r-00000 truck_event.csv

# See the content of the “truck_event.csv

cat truck_event.csv | tail -n 2


