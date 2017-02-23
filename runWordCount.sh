#!/bin/bash
echo "Creating Directories" 
hadoop fs -mkdir /user/yerath
hadoop fs -chown yerath /user/yerath
hadoop fs -mkdir /user/yerath/wordcount /user/yerath/wordcount/input 

echo "Creating input files" 
hadoop fs -rm -f -r /user/yerath/wordcount/input
hadoop fs -put Alice /user/yerath/wordcount/input

echo "Removing old results"
hadoop fs -rm -r /user/yerath/wordcount/output 

echo "Running WordCount"
make

echo "Results"
hadoop fs -cat /user/yerath/wordcount/output/*
