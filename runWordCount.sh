#!/bin/bash
echo "Removing old results"
hadoop fs -rm -r /user/yerath/wordcount/output 

echo "Running WordCount"
make

echo "Results"
hadoop fs -cat /user/yerath/wordcount/output/*
