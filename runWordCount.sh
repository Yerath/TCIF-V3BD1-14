#!/bin/bash
echo "Rebuild JAR File"
#javac -cp /usr/lib/hadoop/*:/usr/lib/hadoop-mapreduce/* WordCount.java -d build -Xlint
javac -cp /usr/local/Cellar/hadoop/2.7.3/libexec/etc/hadoop:/usr/local/Cellar/hadoop/2.7.3/libexec/share/hadoop/common/lib/*:/usr/local/Cellar/hadoop/2.7.3/libexec/share/hadoop/common/*:/usr/local/Cellar/hadoop/2.7.3/libexec/share/hadoop/hdfs:/usr/local/Cellar/hadoop/2.7.3/libexec/share/hadoop/hdfs/lib/*:/usr/local/Cellar/hadoop/2.7.3/libexec/share/hadoop/hdfs/*:/usr/local/Cellar/hadoop/2.7.3/libexec/share/hadoop/yarn/lib/*:/usr/local/Cellar/hadoop/2.7.3/libexec/share/hadoop/yarn/*:/usr/local/Cellar/hadoop/2.7.3/libexec/share/hadoop/mapreduce/lib/*:/usr/local/Cellar/hadoop/2.7.3/libexec/share/hadoop/mapreduce/*:/contrib/capacity-scheduler/*.jar WordCount.java -d build -Xlint

echo "Removing old results"
hadoop fs -rm -r /user/yerath/wordcount/output 

echo "Running WordCount"
hadoop jar wordcount.jar org.myorg.WordCount /user/yerath/wordcount/input /user/yerath/wordcount/output 

echo "Results"
hadoop fs -cat /user/yerath/wordcount/output/*
